const router = require("express").Router();
const produit = require("../controllers/product.controller");
router.get("/create", produit.create);
router.get("/", produit.getAll);
router.get("/produit/:id", produit.findById);
router.get("/produit/detail/:id", produit.getDetails);
router.get("/update/:id", produit.update);
router.get("/delete/:id", produit.delete);
module.exports = router;
