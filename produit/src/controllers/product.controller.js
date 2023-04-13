const db = require("../models");
const Product = db.product;
const Details = db.productDetail;
const Discount = db.discount;
const Category = db.category;

exports.create = async (req, res) => {
  if (!req.body.name) {
    res.status(400).send({
      message: "Content can not be empty!",
    });
    return;
  }

  // Create a product
  const produit = {
    name: req.body.name,
    price: req.body.price,
    categoryId: req.body.categoryId,
  };

  // Save product  in the database
  Product.create(produit)
    .then((data) => {
      res.status(200).send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Some error occurred while creating product .",
      });
    });
};
exports.findAll = async (req, res) => {
  const name = req.query.name;
  var condition = name ? { name: { [Op.like]: `%${name}%` } } : null;

  Product.findAll({
    where: condition,
    include: [
      {
        model: Details,
        required: false,
      },
      {
        model: Discount,
        required: false,
      },
      {
        model: Category,
        required: false,
      },
    ],
    attributes: ["id", "name", "price"],
  })
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving products .",
      });
    });
};
exports.findOne = async (req, res) => {
  const id = req.params.id;

  Product.findByPk(id, {
    include: [
      {
        model: Details,
        required: false,
      },
      {
        model: Discount,
        required: false,
      },
      {
        model: Category,
        required: false,
      },
    ],
    attributes: ["id", "name", "price"],
  })
    .then((data) => {
      if (data) res.send(data);
      else {
        res.status(404).send({
          message: `Cannot find product  with id=${id}.`,
        });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message ||
          "Some error occurred while retrieving products with id = " + id,
      });
    });
};
exports.update = async (req, res) => {
  const id = req.params.id;

  Product.update(req.body, {
    where: { id: id },
  })
    .then((num) => {
      if (num == 1) {
        res.send({
          message: "Product  was updated successfully.",
        });
      } else {
        res.send({
          message: `Cannot update Product  with id=${id}. Maybe Product  was not found or req.body is empty!`,
        });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message: "Error updating Product  with id=" + id,
      });
    });
};
exports.delete = async (req, res) => {
  const id = req.params.id;

  Product.destroy({
    where: { id: id },
  })
    .then((num) => {
      if (num == 1) {
        res.send({
          message: "Product  was deleted successfully!",
        });
      } else {
        res.send({
          message: `Cannot delete Product  with id=${id}. Maybe Product  was not found!`,
        });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message: "Could not delete Product with id=" + id,
      });
    });
};
exports.deleteAll = async (req, res) => {
  Product.destroy({
    where: {},
    truncate: false,
  })
    .then((nums) => {
      res.send({ message: `${nums} products  were deleted successfully!` });
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while removing all products .",
      });
    });
};
