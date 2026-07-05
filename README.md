# Lexcora Backend API

Lexcora Backend is a Node.js + Express 5 REST API powering the Lexcora Law Office Management ERP system. It connects to a MySQL database and handles authentication, case management, document storage (using S3-compatible Cloudflare R2 / Vercel Blob), human resources, and financial management.

---

## Table of Contents
1. [Tech Stack](#tech-stack)
2. [Folder Structure](#folder-structure)
3. [Environment Variables](#environment-variables)
4. [Quick Start & Local Development](#quick-start--local-development)
5. [Database & Migrations](#database--migrations)
6. [Production Deployment & Safety](#production-deployment--safety)
7. [Testing](#testing)

---

## Tech Stack
- **Runtime**: Node.js (`>=18`)
- **Web Framework**: Express 5
- **Database**: MySQL (using `mysql2` client pool)
- **Authentication**: JSON Web Token (JWT) with Access & Refresh tokens
- **Storage**: S3-compatible API (Cloudflare R2) and Vercel Blob SDK
- **Integrations**: OpenAI API for the Legal Assistant, PDF-parse, Mammoth, XLSX

---

## Folder Structure
```
lexcora-backend/
├── api/                  # Vercel Serverless Function entrypoint (index.js)
├── migrations/           # Raw database SQL migration files
├── scripts/              # Migration, maintenance, and setup utilities
├── src/
│   ├── app.js            # Main Express application configuration
│   ├── config/           # Database pools and configurations
│   ├── controllers/      # Route request/response handlers
│   ├── jobs/             # Background queues and workers
│   ├── middlewares/      # Express middlewares (security, CORS, logs, i18n, etc.)
│   ├── models/           # MySQL database queries and schemas
│   ├── routes/           # REST API route mappings
│   ├── services/         # Business logic layer
│   └── utils/            # Shared helper functions (passwords, formatters)
├── vercel.json           # Vercel serverless configurations
├── package.json          # Dependency list and npm scripts
└── README.md             # This guide
```

---

## Environment Variables
Create a `.env` file at the root of the project. Refer to `.env.example` for details:

| Variable | Description | Example |
|----------|-------------|---------|
| `NODE_ENV` | Environment stage | `development` / `production` |
| `PORT` | Local server port | `8080` |
| `JWT_SECRET` | Secret key for access token signing | *Min 32 random characters* |
| `JWT_EXPIRES_IN` | Access token lifespan | `24h` |
| `JWT_REFRESH_SECRET` | Secret key for refresh tokens | *Min 32 random characters* |
| `JWT_REFRESH_EXPIRES_IN`| Refresh token lifespan | `7d` |
| `COOKIE_SECRET` | Secret for cookie parser security | *Min 32 random characters* |
| `DB_HOST` | Database host URL | `127.0.0.1` or Railway host |
| `DB_PORT` | Database port number | `3306` |
| `DB_NAME` | Database schema name | `lexcora` |
| `DB_USER` | Database user name | `root` |
| `DB_PASSWORD` | Database user password | `your_secure_password` |
| `AWS_ACCESS_KEY_ID` | Cloudflare R2 / S3 access key | *R2 Access Key* |
| `AWS_SECRET_ACCESS_KEY` | Cloudflare R2 / S3 secret key | *R2 Secret Key* |
| `S3_ENDPOINT` | Custom endpoint for Cloudflare R2 | `https://<id>.r2.cloudflarestorage.com` |
| `AWS_S3_BUCKET_NAME` | Name of the bucket | `lexcora` |
| `CORS_ORIGINS` | Allowed origins (comma-separated) | `http://localhost:3000` |
| `OPENAI_API_KEY` | OpenAI API Key (AI Legal Assistant) | `sk-proj-...` |

---

## Quick Start & Local Development

### Prerequisites
- Node.js version 18, 20, 22, or 24 installed.
- MySQL server running locally or accessible remotely.

### Installation
1. Clone the repository and navigate to the directory:
   ```bash
   cd lexcora-backend
   ```
2. Install npm dependencies:
   ```bash
   npm install
   ```
3. Copy `.env.example` to `.env` and fill in the configuration details:
   ```bash
   cp .env.example .env
   ```
4. Start the development server:
   ```bash
   npm run dev
   ```
   The API will be available at `http://localhost:8080`.

---

## Database & Migrations

### Startup Migrations (Development)
By default, the backend automatically runs idempotent, basic table-schema checks on startup when running in a development environment (`NODE_ENV !== 'production'` or `RUN_MIGRATIONS=true`). See [src/app.js](file:///c:/projects/lexcora-backend/src/app.js) for details.

### Maintenance & Migration Scripts
All utility, schema alteration, and diagnostic scripts are safely consolidated in the `scripts/` directory.

> [!CAUTION]
> Running maintenance/migration scripts directly against a production database is risky.
> For security, all scripts are equipped with **safety guards** that block execution when `NODE_ENV=production`.
> To run a script in production, you must explicitly set `FORCE_PRODUCTION_MIGRATION=true` in your environment.
>
> Example:
> ```bash
> NODE_ENV=production FORCE_PRODUCTION_MIGRATION=true node scripts/run_migration.js
> ```

---

## Production Deployment & Safety
The API is designed to deploy seamlessly as serverless functions on **Vercel** (`api/index.js` is the entrypoint).
- Background queues/workers are automatically disabled in serverless runtime (`VERCEL=1` or `NODE_ENV=production`) to prevent execution timeouts and database exhaustion.
- Make sure to define all environment variables (including `COOKIE_SECRET` and `JWT_SECRET`) in your production hosting panel.

---

## Testing

### Automated Unit/Integration Tests
To run local JS tests:
```bash
npm run test
```

### API Endpoint Tests (Bruno)
To run API integration tests using [Bruno CLI](https://usebruno.com/):
```bash
npm run test:api
```
