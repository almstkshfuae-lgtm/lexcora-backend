-- ============================================================
-- Migration: Unify all table collations to utf8mb4_0900_ai_ci
-- Date: 2026-07-05
-- Reason: Several banking/cash tables were created with
--         utf8mb4_unicode_ci causing collation mismatch errors
--         on JOINs and Arabic text comparisons.
-- ============================================================

-- Tables created by banking_cash_management migration with wrong collation
ALTER TABLE bank_account_log_attachments CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
ALTER TABLE bank_account_logs            CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
ALTER TABLE bank_statement_imports       CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
ALTER TABLE bank_statement_lines         CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
ALTER TABLE cash_transaction_attachments CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
ALTER TABLE employee_cash_transactions   CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
ALTER TABLE invoice_attachments          CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
ALTER TABLE parties_forms                CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
ALTER TABLE petty_cash_funds             CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
ALTER TABLE petty_cash_transactions      CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Legacy test table from old dump
ALTER TABLE test                         CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
