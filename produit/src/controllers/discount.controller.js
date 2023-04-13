const db = require("../models");
const ProductDiscount = db.product_discount;
const Discount = db.discount;
const Product = db.product;
const Sequelize = require("sequelize");

const { Op } = require("sequelize");

exports.create = async (req, res) => {
  if (!req.body.name) {
    res.status(400).send({
      message: "Content can not be empty!",
    });
    return;
  }

  const dsc = {
    name: req.body.name,
    desc: req.body.desc,
    percent: req.body.percent,
    date_creation: req.body.date_creation,
    date_limit: req.body.date_limit,
  };
  const discount = {};
  Discount.create(dsc)
    .then((data) => {
      const l = req.body.products;
      if (l) {
        l.map((id) => {
          Product.findByPk(id).then((produit) => {
            if (produit) {
              ProductDiscount.create({
                discountId: data.id,
                productId: produit.id,
              });
            }
          });
        });
      }
      res.status(200).send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating discount  .",
      });
    });
};
// get active discount
exports.findAll = async (req, res) => {
  const currentDate = new Date();
  console.log(currentDate);

  Discount.findAll({
    where: {
      date_limit: {
        [Op.gte]: currentDate,
      },
    },
    attributes: [
      "id",
      "name",
      "desc",
      "percent",
      "date_creation",
      "date_limit",
    ],
    include: {
      model: Product,
      required: false,
      attributes: ["id", "name", "price"],
    },
  })
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving discounts .",
      });
    });
};
exports.findOne = async (req, res) => {
  const id = req.params.id;

  Discount.findByPk(id, {
    include: [
      {
        model: Product,
        required: false,
      },
    ],
  })
    .then((data) => {
      if (data) res.send(data);
      else {
        res.status(404).send({
          message: `Cannot find discount  with id=${id}.`,
        });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message ||
          "Some error occurred while retrieving discount  with id = " + id,
      });
    });
};

exports.update = async (req, res) => {
  const id = req.params.id;

  Discount.update(req.body, {
    where: { id: id },
  })
    .then((num) => {
      if (num == 1) {
        res.send({
          message: "discount   was updated successfully.",
        });
      } else {
        res.send({
          message: `Cannot update discount   with id=${id}. Maybe discount   was not found or req.body is empty!`,
        });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message: "Error updating discount   with id=" + id,
      });
    });
};

exports.delete = async (req, res) => {
  const id = req.params.id;

  Discount.destroy({
    where: { id: id },
  })
    .then((num) => {
      if (num == 1) {
        res.send({
          message: "discount   was deleted successfully!",
        });
      } else {
        res.send({
          message: `Cannot delete discount   with id=${id}. Maybe discount   was not found!`,
        });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message: "Could not delete discount  with id=" + id,
      });
    });
};

exports.deleteAll = async (req, res) => {
  Discount.destroy({
    where: {},
    truncate: false,
  })
    .then((nums) => {
      res.send({ message: `${nums} discounts  were deleted successfully!` });
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while removing all discounts  .",
      });
    });
};
