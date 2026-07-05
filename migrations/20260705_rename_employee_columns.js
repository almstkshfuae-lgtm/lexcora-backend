const mysql = require('mysql2/promise');
require('dotenv').config();

const DB = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: parseInt(process.env.DB_PORT) || 3306,
  connectTimeout: 60000
};

async function columnExists(conn, table, column) {
  const [rows] = await conn.query(
    `SELECT COUNT(*) as cnt FROM information_schema.columns
     WHERE table_schema = ? AND table_name = ? AND column_name = ?`,
    [DB.database, table, column]
  );
  return rows[0].cnt > 0;
}

async function renameColumn(conn, table, oldName, newName, typeDefinition) {
  const oldExists = await columnExists(conn, table, oldName);
  const newExists = await columnExists(conn, table, newName);

  if (oldExists) {
    if (newExists) {
      console.log(`  ⏭  Column '${oldName}' exists but '${newName}' also exists. Skipping rename.`);
    } else {
      console.log(`  🔄 Renaming column '${oldName}' to '${newName}'...`);
      // MySQL 8.0 supports ALTER TABLE RENAME COLUMN old TO new
      // To support MySQL 5.7+ we can use CHANGE COLUMN
      await conn.query(`ALTER TABLE \`${table}\` CHANGE COLUMN \`${oldName}\` \`${newName}\` ${typeDefinition}`);
      console.log(`  ✅ Renamed column '${oldName}' to '${newName}' successfully.`);
    }
  } else {
    if (newExists) {
      console.log(`  ⏭  Column '${newName}' already exists and '${oldName}' is gone. Skipping.`);
    } else {
      console.log(`  ⚠️  Neither '${oldName}' nor '${newName}' exists on table '${table}'.`);
    }
  }
}

async function run() {
  const conn = await mysql.createConnection(process.env.DATABASE_URL || DB);
  console.log('✅ Connected to database:', DB.database || 'default');

  console.log('📋 Renaming misspelled employee columns...');

  // trnsportation_allownce -> transportation_allowance (varchar(20) DEFAULT NULL)
  await renameColumn(conn, 'employees', 'trnsportation_allownce', 'transportation_allowance', 'varchar(20) DEFAULT NULL');

  // another_allownce -> another_allowance (varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL)
  await renameColumn(conn, 'employees', 'another_allownce', 'another_allowance', 'varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL');

  // fisrt_day_of_work -> first_day_of_work (date DEFAULT NULL)
  await renameColumn(conn, 'employees', 'fisrt_day_of_work', 'first_day_of_work', 'date DEFAULT NULL');

  await conn.end();
  console.log('\n🎉 Column renaming migration complete!');
}

run().catch(e => {
  console.error('❌ Fatal migration error:', e.message);
  process.exit(1);
});
