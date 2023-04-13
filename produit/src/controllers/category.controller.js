const db = require("../models");
const Category = db.category;
const Product = db.product;

const { Op } = require("sequelize");

exports.create = async (req, res) => {
  if (!req.body.name) {
    res.status(400).send({
      message: "Content can not be empty!",
    });
    return;
  }

  // Create a Category
  const ctg = {
    name: req.body.name,
    desc: req.body.desc,
  };

  // Save Category  in the database
  Category.create(ctg)
    .then((data) => {
      res.status(200).send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Some error occurred while creating Category .",
      });
    });
};
exports.findAll = async (req, res) => {
  const name = req.query.name;
  var condition = name ? { name: { [Op.like]: `%${name}%` } } : null;

  Category.findAll({
    where: condition,
    include: [
      {
        model: Product,
        required: false,
      },
    ],
    attributes: ["id", "name", "desc"],
  })
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving category  .",
      });
    });
};
exports.findOne = async (req, res) => {
  const id = req.params.id;

  Category.findByPk(id, {
    include: [
      {
        model: Product,
        required: false,
      },
    ],
    attributes: ["id", "name", "desc"],
  })
    .then((data) => {
      if (data) res.send(data);
      else {
        res.status(404).send({
          message: `Cannot find category   with id=${id}.`,
        });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message ||
          "Some error occurred while retrieving category with id = " + id,
      });
    });
};

exports.update = async (req, res) => {
  const id = req.params.id;

  Category.update(req.body, {
    where: { id: id },
  })
    .then((num) => {
      if (num == 1) {
        res.send({
          message: "Category  was updated successfully.",
        });
      } else {
        res.send({
          message: `Cannot update Category   with id=${id}. Maybe ctg  was not found or req.body is empty!`,
        });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message: "Error updating category   with id=" + id,
      });
    });
};
exports.delete = async (req, res) => {
  const id = req.params.id;

  Category.destroy({
    where: { id: id },
  })
    .then((num) => {
      if (num == 1) {
        res.send({
          message: "ctg  was deleted successfully!",
        });
      } else {
        res.send({
          message: `Cannot delete ctg  with id=${id}. Maybe ctg  was not found!`,
        });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message: "Could not delete ctg with id=" + id,
      });
    });
};
exports.deleteAll = async (req, res) => {
  Category.destroy({
    where: {},
    truncate: false,
  })
    .then((nums) => {
      res.send({ message: `${nums} ctgs  were deleted successfully!` });
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Some error occurred while removing all ctgs .",
      });
    });
};
