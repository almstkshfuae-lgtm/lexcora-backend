/**
 * Security Middleware
 * Blocks common vulnerability scanner probes and enforces basic HTTP hardening.
 */

// Known sensitive paths probed by bots, scanners, and exploit kits
const BLOCKED_PATHS = new Set([
  '/.env',
  '/.env.local',
  '/.env.production',
  '/.env.development',
  '/.git/config',
  '/.git/HEAD',
  '/wp-config.php',
  '/wp-login.php',
  '/wp-admin',
  '/config.php',
  '/phpinfo.php',
  '/info.php',
  '/appsettings.json',
  '/web.config',
  '/server.js',
  '/app.js',
  '/index.php',
  '/admin.php',
  '/setup.php',
  '/install.php',
  '/database.php',
  '/credentials.json',
  '/secrets.json',
  '/aws_credentials',
  '/.aws/credentials',
  '/etc/passwd',
  '/etc/shadow',
  '/proc/self/environ',
]);

// Regex patterns for path-based attack detection
const BLOCKED_PATTERNS = [
  /\/\.git\//,             // Git directory traversal
  /\/\.env/,               // Any .env variant
  /phpinfo/i,              // PHP info probes
  /\/wp-/i,                // WordPress probes
  /\.php$/i,               // PHP file probes on Node server
  /\.\.(\/|\\)/,           // Directory traversal
  /%2e%2e/i,               // URL-encoded traversal
  /\/etc\/(passwd|shadow)/, // Unix system files
  /\.(sh|bash|zsh|cmd|bat|ps1)$/i, // Shell script access
];

// Simple in-memory rate limiter per IP for scanner bursts
const scannerRateMap = new Map();
const RATE_WINDOW_MS = 10_000; // 10 seconds
const MAX_BLOCKED_IN_WINDOW = 5; // block IP after 5 blocked attempts in window

function isRateLimited(ip) {
  const now = Date.now();
  let record = scannerRateMap.get(ip);

  if (!record || now - record.windowStart > RATE_WINDOW_MS) {
    record = { windowStart: now, count: 0 };
  }

  record.count += 1;
  scannerRateMap.set(ip, record);

  // Periodically clean up old entries to prevent memory leak
  if (scannerRateMap.size > 5000) {
    for (const [key, val] of scannerRateMap.entries()) {
      if (now - val.windowStart > RATE_WINDOW_MS * 2) {
        scannerRateMap.delete(key);
      }
    }
  }

  return record.count > MAX_BLOCKED_IN_WINDOW;
}

/**
 * Blocks known scanner probe paths and sets security headers.
 */
function securityMiddleware(req, res, next) {
  const ip = req.ip || req.connection?.remoteAddress || 'unknown';
  const path = req.path?.toLowerCase() || '';

  // Check exact blocked paths
  if (BLOCKED_PATHS.has(path)) {
    if (isRateLimited(ip)) {
      console.warn(`[SECURITY] Aggressive scanner blocked: ip=${ip} path=${req.path}`);
      return res.status(429).end(); // Too Many Requests — starve the scanner
    }
    console.warn(`[SECURITY] Probe blocked: ip=${ip} path=${req.path}`);
    return res.status(404).end();
  }

  // Check regex patterns
  for (const pattern of BLOCKED_PATTERNS) {
    if (pattern.test(req.path)) {
      if (isRateLimited(ip)) {
        console.warn(`[SECURITY] Aggressive scanner blocked: ip=${ip} path=${req.path} pattern=${pattern}`);
        return res.status(429).end();
      }
      console.warn(`[SECURITY] Pattern probe blocked: ip=${ip} path=${req.path} pattern=${pattern}`);
      return res.status(404).end();
    }
  }

  // Security headers (hardening)
  res.setHeader('X-Content-Type-Options', 'nosniff');
  res.setHeader('X-Frame-Options', 'DENY');
  res.setHeader('X-XSS-Protection', '1; mode=block');
  res.setHeader('Referrer-Policy', 'strict-origin-when-cross-origin');
  res.setHeader('Permissions-Policy', 'geolocation=(), microphone=(), camera=()');
  // Remove server fingerprinting header
  res.removeHeader('X-Powered-By');

  next();
}

module.exports = { securityMiddleware };
