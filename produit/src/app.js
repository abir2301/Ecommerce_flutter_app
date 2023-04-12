const express = require("express");
require("dotenv").config();
const app = express();
const bodyParser = require("body-parser");
app.use(bodyParser.json());
var products = require("./routes/product.route");
var categories = require("./routes/product.route");
var db = require("./models");
app.use(bodyParser.json());
app.get("/", (req, res) => {
  res.status(200).send("hey api  📚📚📚📚📚 ");
});
db.sequelize
  .sync()
  .then(() => {
    console.log("Synced db.");
  })
  .catch((err) => {
    console.log("Failed to sync db: " + err.message);
  });
db.sequelize.sync({ force: true }).then(() => {
  console.log("Drop and re-sync db.");
});
app.use("/api/produit", products);
app.use("/api/categories", categories);

const port = process.env.PORT ? process.env.PORT : 3000;

app.listen(port, () => {
  console.log("app run on port ", port);
});
