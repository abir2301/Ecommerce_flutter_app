const router = require("express").Router();
const produit = require("../controllers/product.controller");
const produit_details = require("../controllers/product_details.controller");
const multer = require("multer");
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });
//create new produit
router.post("/", produit.create);
// get all products with details
router.get("/", produit.findAll);
//retrieve single produit by id
router.get("/:id", produit.findOne);
router.put("/:id", produit.update);
router.delete("/:id", produit.delete);
router.delete("/", produit.deleteAll);

//create  produit d details
router.post("/details/:id", produit_details.create);
//update product id details
router.put("/details/:id", produit_details.update);
//delete product id details
router.delete("/details/:id", produit_details.delete);
module.exports = router;
