const express = require("express");
const app = express();
const port = 3000;

app.get("/", (req, res) => {
  res.send("Hello, World! This is my Node.js app! How was your day");
});

app.get("/api", (req, res) => {
  res.json({ message: "This is an API response!" });
});

if (require.main === module) {
  app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
  });
}

module.exports = app; 
