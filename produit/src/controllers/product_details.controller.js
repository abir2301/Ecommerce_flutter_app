const db = require("../models");
const Details = db.productDetail;
const Product = db.product;
//const axios = require("axios");
// const axios = require("axios");
const { Op } = require("sequelize");

// const FormData = require("form-data");

exports.create = async (req, res) => {
  const id = req.params.id;
  if (!id) {
    res.status(400).send({
      message: "product identifier  can not be empty!",
    });
    return;
  }
  Product.findByPk(id).then(async (data) => {
    if (data) {
      const detail = {
        cart_desc: req.body.cart_desc,
        long_desc: req.body.long_desc,
        img: req.body.img,
        productId: id,
      };

      // const file = req.file;

      // // Upload the image to the image server
      // const formData = new FormData();
      // formData.append("image", file.buffer, { filename: file.originalname });
      // const response = await axios.post(
      //   "http://localhost:4000/upload",
      //   formData,
      //   {
      //     headers: formData.getHeaders(),
      //   }
      // );
      // const imageUrl = response.data.imageUrl;
      // detail.imageUrl = imageUrl;
      console.log(detail);
      Details.create(detail)
        .then((data) => {
          res.status(200).send(data);
        })
        .catch((err) => {
          res.status(500).send({
            message:
              err.message ||
              "Some error occurred while creating produst details  .",
          });
        });
    } else {
      res.status(404).send("product not found ");
    }
  });
};

exports.update = async (req, res) => {
  const id = req.params.id;
  if (!id) {
    res.status(400).send({
      message: "product identifier  can not be empty!",
    });
    return;
  }

  Product.findByPk(id).then((data) => {
    if (data) {
      Details.update(req.body, {
        where: { productId: id },
      })
        .then((num) => {
          if (num == 1) {
            res.send({
              message: "product details   was updated successfully.",
            });
          } else {
            res.send({
              message: `Cannot update this product details   with id=${req.body.productId}. Maybe Product  was not found or req.body is empty!`,
            });
          }
        })
        .catch((err) => {
          res.status(500).send({
            message: "Error updating Product  with id=" + id,
          });
        });
    } else {
      res.status(404).send("product not found ");
    }
  });
};
exports.delete = async (req, res) => {
  const id = req.params.id;
  if (!id) {
    res.status(400).send({
      message: "product identifier  can not be empty!",
    });
    return;
  }

  Product.findByPk(id).then((data) => {
    if (data) {
      Details.destroy({
        where: { productId: id },
      })
        .then((num) => {
          if (num == 1) {
            res.send({
              message: "product details  was deleted successfully! .",
            });
          } else {
            res.send({
              message: `Cannot delete product details   with id=${id}. Maybe Product  was not found!!`,
            });
          }
        })
        .catch((err) => {
          res.status(500).send({
            message: "Error updating Details product   with id=" + id,
          });
        });
    } else {
      res.status(404).send("product not found ");
    }
  });
};
