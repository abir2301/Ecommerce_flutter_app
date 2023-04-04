const router = require("express").Router();
const category = require("../controllers/category.controller");
router.get("/create", category.create);
router.get("/", category.getAll);
router.get("/category/:id", category.findById);
router.get("/products/:id", category.getProducts);
router.get("/update/:id", category.update);
router.get("/delete/:id", category.delete);
module.exports = router;
