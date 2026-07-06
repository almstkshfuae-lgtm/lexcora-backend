/**
 * scratch/check_all_constraints.js
 *
 * Stage 2 – Data Model Alignment
 * --------------------------------
 * Run this script against the live database to verify that every foreign-key
 * relationship and NOT-NULL / CHECK constraint on the case-related tables is
 * sound.  It also dumps the actual column definitions so you can cross-check
 * them against the validators in src/middlewares/validators.js and the field
 * names used by the frontend payload.
 *
 * Usage (from project root):
 *   node scratch/check_all_constraints.js
 *
 * Prerequisites:
 *   • .env must be present with DATABASE_URL or DB_HOST / DB_NAME / DB_USER /
 *     DB_PASSWORD set — whichever your src/config/db.js reads.
 *   • The database user must have SELECT on information_schema.
 */

const db = require('../src/config/db');
require('dotenv').config();

// ─── Tables to inspect ───────────────────────────────────────────────────────
const CASE_TABLES = [
  'cases',
  'sessions',
  'session_documents',
  'executions',
  'executions_documents',
  'tasks',
  'task_documents',
  'judicial_orders',
  'judicial_orders_documents',
  'case_petitions',
  'case_petition_documents',
  'case_parties',
  'case_parties_documents',
  'case_documents',
  'court_case_documents',
  'case_employees_documents',
  'case_degrees',
  'related_cases',
  'case_related_files',
  'memos',
  'memo_documents',
];

// ─── Helpers ──────────────────────────────────────────────────────────────────
const section = (title) =>
  console.log(`\n${'─'.repeat(72)}\n  ${title}\n${'─'.repeat(72)}`);

const ok = (msg) => console.log(`  ✓  ${msg}`);
const warn = (msg) => console.warn(`  ⚠  ${msg}`);
const fail = (msg) => console.error(`  ✗  ${msg}`);

// ─── 1. Foreign-key constraints ───────────────────────────────────────────────
async function checkForeignKeys() {
  section('FOREIGN KEY CONSTRAINTS — case-related tables');

  const [rows] = await db.query(`
    SELECT
      kcu.TABLE_NAME,
      kcu.COLUMN_NAME,
      kcu.CONSTRAINT_NAME,
      kcu.REFERENCED_TABLE_NAME,
      kcu.REFERENCED_COLUMN_NAME,
      rc.UPDATE_RULE,
      rc.DELETE_RULE
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu
    JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS rc
      ON rc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
     AND rc.CONSTRAINT_SCHEMA = DATABASE()
    WHERE kcu.TABLE_SCHEMA = DATABASE()
      AND kcu.TABLE_NAME IN (${CASE_TABLES.map(() => '?').join(',')})
    ORDER BY kcu.TABLE_NAME, kcu.COLUMN_NAME
  `, CASE_TABLES);

  if (rows.length === 0) {
    warn('No FK constraints found — check TABLE_NAMES list.');
    return;
  }

  let currentTable = null;
  for (const row of rows) {
    if (row.TABLE_NAME !== currentTable) {
      currentTable = row.TABLE_NAME;
      console.log(`\n  Table: ${currentTable}`);
    }
    const deleteRule = row.DELETE_RULE === 'CASCADE' ? '(CASCADE)' : `(${row.DELETE_RULE})`;
    ok(
      `${row.COLUMN_NAME} → ${row.REFERENCED_TABLE_NAME}.${row.REFERENCED_COLUMN_NAME}` +
      `  ${deleteRule}`
    );
  }
}

// ─── 2. NOT NULL columns (excluding auto-managed cols) ────────────────────────
async function checkNotNullColumns() {
  section('NOT-NULL COLUMNS — case-related tables');

  const [rows] = await db.query(`
    SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, COLUMN_TYPE, COLUMN_DEFAULT, EXTRA
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME IN (${CASE_TABLES.map(() => '?').join(',')})
      AND IS_NULLABLE = 'NO'
      AND COLUMN_NAME NOT IN ('id', 'created_at', 'updated_at')
      AND EXTRA NOT LIKE '%auto_increment%'
    ORDER BY TABLE_NAME, ORDINAL_POSITION
  `, CASE_TABLES);

  let currentTable = null;
  for (const row of rows) {
    if (row.TABLE_NAME !== currentTable) {
      currentTable = row.TABLE_NAME;
      console.log(`\n  Table: ${currentTable}`);
    }
    const def = row.COLUMN_DEFAULT !== null ? ` [default: ${row.COLUMN_DEFAULT}]` : ' [NO DEFAULT]';
    ok(`${row.COLUMN_NAME}  ${row.COLUMN_TYPE}${def}`);
  }

  if (rows.length === 0) warn('No NOT-NULL non-PK columns found.');
}

// ─── 3. Column definitions for the main cases table ───────────────────────────
async function checkCasesColumns() {
  section('COLUMN DEFINITIONS — cases table');

  const [rows] = await db.query(`
    SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_DEFAULT, EXTRA
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'cases'
    ORDER BY ORDINAL_POSITION
  `);

  console.log('');
  for (const row of rows) {
    const nullable = row.IS_NULLABLE === 'YES' ? 'nullable' : 'NOT NULL';
    const def = row.COLUMN_DEFAULT !== null ? `, default: ${row.COLUMN_DEFAULT}` : '';
    const extra = row.EXTRA ? ` [${row.EXTRA}]` : '';
    console.log(`  ${row.COLUMN_NAME.padEnd(28)} ${row.COLUMN_TYPE.padEnd(20)} ${nullable}${def}${extra}`);
  }
}

// ─── 4. Orphan detection — sessions without a valid case_id ──────────────────
async function checkOrphans() {
  section('ORPHAN DETECTION');

  const checks = [
    {
      label: 'sessions with missing case',
      sql: 'SELECT COUNT(*) AS n FROM sessions s LEFT JOIN cases c ON s.case_id = c.id WHERE c.id IS NULL',
    },
    {
      label: 'executions with missing case',
      sql: 'SELECT COUNT(*) AS n FROM executions e LEFT JOIN cases c ON e.case_id = c.id WHERE c.id IS NULL',
    },
    {
      label: 'tasks with missing case',
      sql: 'SELECT COUNT(*) AS n FROM tasks t LEFT JOIN cases c ON t.case_id = c.id WHERE c.id IS NULL AND t.case_id IS NOT NULL',
    },
    {
      label: 'judicial_orders with missing case',
      sql: 'SELECT COUNT(*) AS n FROM judicial_orders jo LEFT JOIN cases c ON jo.case_id = c.id WHERE c.id IS NULL',
    },
    {
      label: 'case_petitions with missing case',
      sql: 'SELECT COUNT(*) AS n FROM case_petitions cp LEFT JOIN cases c ON cp.case_id = c.id WHERE c.id IS NULL',
    },
    {
      label: 'case_parties with missing party',
      sql: 'SELECT COUNT(*) AS n FROM case_parties cp LEFT JOIN parties p ON cp.party_id = p.id WHERE p.id IS NULL',
    },
    {
      label: 'case_parties with missing case',
      sql: 'SELECT COUNT(*) AS n FROM case_parties cp LEFT JOIN cases c ON cp.case_id = c.id WHERE c.id IS NULL',
    },
  ];

  for (const check of checks) {
    const [[{ n }]] = await db.query(check.sql);
    if (n > 0) {
      fail(`${n} orphan row(s) — ${check.label}`);
    } else {
      ok(check.label);
    }
  }
}

// ─── 5. Frontend ↔ Backend field-name alignment check ────────────────────────
//
// This is a static documentation check — it prints the mapping used by
// casesService.createCaseWithRelations so you can compare against the
// frontend Formik payload in src/app/cases/add-case/page.js.
//
function printFieldMapping() {
  section('FRONTEND ↔ BACKEND FIELD MAPPING (static reference)');

  const mappings = [
    // case core
    { frontend: 'caseData.case_number',         backend: 'cases.case_number',           notes: '' },
    { frontend: 'caseData.police_station_id',   backend: 'cases.police_station_id',     notes: '' },
    { frontend: 'caseData.public_prosecution_id', backend: 'cases.public_prosecution_id', notes: '' },
    { frontend: 'caseData.court_id',            backend: 'cases.court_id',              notes: '' },
    { frontend: 'caseData.lawyer_id',           backend: 'cases.lawyer_id',             notes: '' },
    { frontend: 'caseData.secretary_id',        backend: 'cases.secretary_id',          notes: '' },
    { frontend: 'caseData.case_classification_id', backend: 'cases.case_classification_id', notes: '' },
    { frontend: 'caseData.case_type_id',        backend: 'cases.case_type_id',          notes: '' },
    { frontend: 'caseData.legal_advisor_id',    backend: 'cases.legal_advisor_id',      notes: '' },
    { frontend: 'caseData.legal_researcher_id', backend: 'cases.legal_researcher_id',   notes: '' },
    { frontend: 'caseData.counter_case_id',     backend: 'cases.counter_case_id',       notes: '' },
    { frontend: 'caseData.fees',                backend: 'cases.fees',                  notes: 'cast to Number' },
    { frontend: 'caseData.additional_note',     backend: 'cases.additional_note',       notes: '' },
    { frontend: 'caseData.topic',               backend: 'cases.topic',                 notes: '' },
    { frontend: 'caseData.branch_id',           backend: 'cases.branch_id',             notes: '' },
    { frontend: 'caseData.is_important',        backend: 'cases.is_important',          notes: 'boolean → 0/1' },
    { frontend: 'caseData.is_secret',           backend: 'cases.is_secret',             notes: 'boolean → 0/1' },
    { frontend: 'caseData.is_archived',         backend: 'cases.is_archived',           notes: 'boolean → 0/1' },
    { frontend: 'caseData.is_pending',          backend: 'cases.is_pending',            notes: 'boolean → 0/1' },
    // sessions
    { frontend: 'session.date',                 backend: 'sessions.session_date',       notes: 'format: yyyy-MM-dd HH:mm:ss' },
    { frontend: 'session.link',                 backend: 'sessions.link',               notes: '' },
    { frontend: 'session.isExpertSession',      backend: 'sessions.is_expert_session',  notes: 'camelCase accepted by service' },
    { frontend: 'session.decision',             backend: 'sessions.decision',           notes: '' },
    { frontend: 'session.note',                 backend: 'sessions.note',               notes: '' },
    // executions
    { frontend: 'execution.date',               backend: 'executions.date',             notes: 'format: yyyy-MM-dd' },
    { frontend: 'execution.type',               backend: 'executions.type',             notes: '' },
    { frontend: 'execution.status',             backend: 'executions.status',           notes: 'pending|in_progress|completed|cancelled' },
    { frontend: 'execution.amount',             backend: 'executions.amount',           notes: '' },
    { frontend: 'execution.attachedFiles',      backend: 'executions_documents',        notes: 'uploaded before POST' },
    // tasks
    { frontend: 'task.title',                   backend: 'tasks.title',                 notes: '' },
    { frontend: 'task.description',             backend: 'tasks.description',           notes: '' },
    { frontend: 'task.assignedTo',              backend: 'tasks.assigned_to',           notes: 'camelCase accepted by service' },
    { frontend: 'task.dueDate',                 backend: 'tasks.due_date',              notes: 'camelCase accepted by service' },
    { frontend: 'task.priority',                backend: 'tasks.priority',              notes: 'low|medium|high|urgent' },
    { frontend: 'task.files',                   backend: 'task_documents',              notes: 'raw File objects uploaded before POST' },
    // judicial notices
    { frontend: 'notice.certificationDate',     backend: 'judicial_orders.date',        notes: 'format: yyyy-MM-dd' },
    { frontend: 'notice.noticePeriod',          backend: 'judicial_orders.notification_period_days', notes: '' },
    { frontend: 'notice.lawsuitFiled',          backend: 'judicial_orders.case_filed',  notes: 'boolean' },
    { frontend: 'notice.noticeCompleted',       backend: 'judicial_orders.service_completed', notes: 'boolean' },
    // petitions
    { frontend: 'petition.submissionDate',      backend: 'case_petitions.date',         notes: 'format: yyyy-MM-dd' },
    { frontend: 'petition.orderType',           backend: 'case_petitions.type',         notes: '' },
    { frontend: 'petition.judgeDecision',       backend: 'case_petitions.decision',     notes: 'true/false boolean' },
    { frontend: 'petition.appealDate',          backend: 'case_petitions.appeal_date',  notes: 'format: yyyy-MM-dd' },
    // parties
    { frontend: 'party.id',                     backend: 'case_parties.party_id',       notes: 'existing party id' },
    { frontend: 'party.type',                   backend: 'case_parties.type',           notes: 'client|opponent' },
    { frontend: 'party.files',                  backend: 'case_parties_documents',      notes: 'uploaded before POST' },
  ];

  const colW = [35, 40, 10];
  const header = [
    'Frontend field'.padEnd(colW[0]),
    'Backend column'.padEnd(colW[1]),
    'Notes',
  ].join('  ');
  console.log(`\n  ${header}`);
  console.log(`  ${'─'.repeat(header.length)}`);

  for (const m of mappings) {
    console.log(
      `  ${m.frontend.padEnd(colW[0])}  ${m.backend.padEnd(colW[1])}  ${m.notes}`
    );
  }
}

// ─── Main ─────────────────────────────────────────────────────────────────────
(async () => {
  try {
    await checkForeignKeys();
    await checkNotNullColumns();
    await checkCasesColumns();
    await checkOrphans();
    printFieldMapping();

    section('DONE');
    console.log('  All checks completed.\n');
  } catch (err) {
    console.error('\nFatal error running constraint checks:', err.message);
    console.error(err.stack);
    process.exit(1);
  } finally {
    process.exit(0);
  }
})();
