const router = require("express").Router();
const discount = require("../controllers/discount.controller");

router.post("/", discount.create);
router.get("/", discount.findAll);
router.get("/:id", discount.findOne);

router.put("/:id", discount.update);
router.delete("/:id", discount.delete);
router.delete("/", discount.deleteAll);
module.exports = router;
