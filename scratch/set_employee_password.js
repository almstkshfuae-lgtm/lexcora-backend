const bcrypt = require("bcrypt");
const db = require("../src/config/db");
require("dotenv").config();

async function setPassword(username, newPassword) {
  try {
    const hashedPassword = await bcrypt.hash(newPassword, 10);
    const [result] = await db.query(
      "UPDATE employees SET password = ? WHERE username = ?",
      [hashedPassword, username]
    );

    if (result.affectedRows > 0) {
      console.log(`\n✅ Successfully updated password for user "${username}" to "${newPassword}"`);
    } else {
      console.log(`\n❌ User "${username}" not found in database.`);
    }
  } catch (error) {
    console.error("Error setting password:", error);
  } finally {
    await db.end();
  }
}

// Get arguments from command line
const args = process.argv.slice(2);
if (args.length < 2) {
  console.log("Usage: node set_employee_password.js <username> <new_password>");
  process.exit(1);
}

setPassword(args[0], args[1]);
