# Lexcora Project Briefing

> Place this file at the root of your VS Code workspace.
> This file tells any coding agent everything it needs to know about this project.

---

## What Is This Project?

**Lexcora** is a Law Office Management ERP system with:
- Arabic + English (RTL/LTR) full support
- Role-based access control (admin, lawyer, client)
- Case management, documents, HR, sessions, tasks
- Financial Management (Invoicing, AR/AP, Vendor Management, Aging Analysis)

---

## Repository Structure

This workspace contains 3 separate cloned repositories:

```
workspace/
â”œâ”€â”€ lexcora-backend/        # Node.js + Express 5 REST API
â”œâ”€â”€ lexcora-frontend/       # Next.js (admin/staff dashboard)
â””â”€â”€ lexcora-client-portal/  # Next.js (client-facing portal)
```

Each repo is an independent project with its own `package.json`, `.env`, and Vercel deployment.

---

## Current Mission: AWS â†’ Vercel + Railway + Vercel Blob

The system was previously hosted on AWS (Elastic Beanstalk + RDS + S3).
AWS suspended the account due to billing. We are migrating to a cheaper stack.

### New Infrastructure

| Component     | Old (AWS)              | New                          |
|---------------|------------------------|------------------------------|
| Backend host  | Elastic Beanstalk      | Vercel (Serverless)          |
| Database      | RDS MySQL              | Railway MySQL                |
| File storage  | S3                     | Vercel Blob                  |
| Frontend      | â€”                      | Vercel                       |
| Client Portal | â€”                      | Vercel                       |

### Monthly Cost Target: ~$5/month (Railway MySQL only)

---

## Backend â€” `lexcora-backend`

### Stack
- Node.js >= 18.18.0
- Express 5
- MySQL2 (relational DB â€” complex schema with many tables)
- JWT authentication (access + refresh tokens)
- Multer (file uploads)
- Vercel Blob SDK (file storage)
- OpenAI API integration
- PDF-parse, Mammoth, XLSX for document processing

### Key Files
```
api/index.js     # Entry point — app.listen(PORT, "0.0.0.0")
src/app.js        # Express app setup
src/config/db.js  # MySQL2 connection pool
vercel.json       # Already configured for Vercel deployment
```

### vercel.json (already in repo)
```json
{
  "version": 2,
  "rewrites": [{ "source": "/(.*)", "destination": "/api/index.js" }],
  "crons": [{ "path": "/api/accounting/assets/run-depreciation", "schedule": "0 0 1 * *" }]
}
```

### Environment Variables (Backend)
Create `.env` in `lexcora-backend/`:
```env
NODE_ENV=production
PORT=8080

# JWT
JWT_SECRET=<generate-new-64-char-string>
JWT_EXPIRES_IN=24h
JWT_REFRESH_SECRET=<generate-new-64-char-string>
JWT_REFRESH_EXPIRES_IN=7d

# Database â€” Railway MySQL
DB_HOST=<railway-host>
DB_PORT=<railway-port>
DB_NAME=lexcora
DB_USER=<railway-user>
DB_PASSWORD=<railway-password>

# File Storage â€” Vercel Blob
AWS_ACCESS_KEY_ID=<r2-access-key>
AWS_SECRET_ACCESS_KEY=<r2-secret-key>
AWS_REGION=auto
AWS_S3_BUCKET_NAME=lexcora
S3_ENDPOINT=https://<account-id>.r2.cloudflarestorage.com
```

### Critical Note on File Storage
The backend uses `@aws-sdk/client-s3` â€” **no code change needed**.
Cloudflare R2 is S3-compatible. Only the env vars change:
- Add `S3_ENDPOINT` pointing to R2
- Change `AWS_REGION` to `auto`
- Replace AWS credentials with R2 API token credentials

Check `src/` for where S3 client is initialized and make sure it reads `S3_ENDPOINT` from env.
If it doesn't, add this to the S3 client config:
```js
const s3Client = new S3Client({
  region: process.env.AWS_REGION,
  endpoint: process.env.S3_ENDPOINT, // Add this line
  credentials: {
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
  },
});
```

---

## Frontend â€” `lexcora-frontend`

### Stack
- Next.js 14 (App Router likely)
- Connects to backend via REST API
- Arabic/English RTL/LTR support required

### Environment Variables
Create `.env.local` in `lexcora-frontend/`:
```env
NEXT_PUBLIC_API_URL=https://lexcora-backend.vercel.app
```
Add any other vars found in `.env.example` if it exists.

---

## Client Portal â€” `lexcora-client-portal`

### Stack
- Next.js (client-facing)
- Connects to same backend

### Environment Variables
Create `.env.local` in `lexcora-client-portal/`:
```env
NEXT_PUBLIC_API_URL=https://lexcora-backend.vercel.app
```

---

## Vercel Projects (Already Created)

| Repo                  | Vercel Project       | URL                                      | Status  |
|-----------------------|----------------------|------------------------------------------|---------|
| lexcora-backend       | lexcora-backend      | https://lexcora-backend.vercel.app       | Deployed|
| lexcora-frontend      | Not created yet      | â€”                                        | Pending |
| lexcora-client-portal | Not created yet      | â€”                                        | Pending |

**Team:** `almstkshfuae-lgtms-projects`
**Team ID:** `team_9P7hpSywx6RCFmh3dDyKc6e2`

---

## Migration Phases â€” Current Status

- [x] Phase 1 â€” Disable old AWS credentials
- [x] Phase 2 â€” Export MySQL dump from old RDS (Completed: Found in src/config/Database.sql)
- [x] Phase 3 â€” Import to Railway MySQL (Completed: 79 tables imported)
- [x] Phase 4 â€” Setup Cloudflare R2 (Configuration completed, migration skipped as no files were available)
- [x] Phase 5 â€” Add env vars to Vercel backend and redeploy (Completed: Backend is live at https://lexcora-backend.vercel.app)
- [x] Phase 6 â€” Deploy frontend + client portal to Vercel (Frontend: https://lexcora-frontend.vercel.app, Portal: https://lexcora-client-portal.vercel.app)
- [x] Phase 7 â€” End-to-end testing (Backend Healthy: https://lexcora-backend.vercel.app/health)
- [x] Phase 8 â€” AR/AP & Vendor Management Implementation (Backend models, controllers, and services completed)
- [x] Phase 9 â€” Advanced Finance & COA Enhancements (Hierarchical rollup, Budgeting, Aging Reports, Fiscal Periods)
- [x] Phase 10 â€” Automated Financial Integrations (Case fees posting to Ledger)
- [x] Phase 11 â€” HR/Finance Integration (Leave value calculation, UAE Labor Law COA mapping, auto-journal generation for HR requests)

---

## Financial Workflow Integrations

### Automated Postings
The system uses a dynamic `posting_settings` table to map business events to GL accounts.
- **CASE_CREATED**: When a case is created with non-zero fees, it automatically posts:
  - **Debit**: Accounts Receivable (1103)
  - **Credit**: Legal Services Revenue (4100)
- **INVOICE_CREATED**: Standard invoicing posts to the same accounts (ensure no double-counting if fees were already posted).
- **PAYMENT_RECEIVED**: Posts to Bank/Cash and clears AR.

---

## Old AWS Credentials (DISABLED â€” for reference only)

```
RDS Host:  lexcora.c1yc80s4ipxt.us-east-2.rds.amazonaws.com
DB Name:   lexcora
DB User:   admin
S3 Bucket: lexcora
Region:    us-east-2
```

> âš ï¸ The AWS IAM key has been disabled. Do not use these credentials.

---

## Coding Rules & Preferences

- Clean, maintainable code â€” no unnecessary complexity
- All UI must support Arabic (RTL) and English (LTR) â€” no hardcoded direction values
- No hardcoded secrets â€” always use environment variables
- Cost-optimized â€” avoid adding paid dependencies
- When modifying S3/file logic, ensure R2 compatibility is preserved

---

## How to Run Locally

### Backend
```bash
cd lexcora-backend
npm install
cp .env.example .env   # or create .env manually
node api/index.js
```

### Frontend
```bash
cd lexcora-frontend
npm install
cp .env.example .env.local
npm run dev
```

### Client Portal
```bash
cd lexcora-client-portal
npm install
cp .env.example .env.local
npm run dev
```

---

## Key Tasks for the Coding Agent

1. **Check S3 client initialization** in `lexcora-backend/src/` â€” ensure `endpoint` is read from `S3_ENDPOINT` env var
2. **Verify all routes** work as serverless functions on Vercel (no persistent state, no local file writes)
3. **Check `multer` config** â€” file uploads must go to R2, not local disk (`memoryStorage` or stream directly to S3)
4. **Confirm `.env.example`** exists in all 3 repos with all required variables listed
5. **Deploy frontend and client portal** to Vercel under team `almstkshfuae-lgtms-projects`

---

*Last updated: April 2026 | Migration target: Vercel + Railway + Cloudflare R2*
