module.exports = (sequelize, Sequelize) => {
  const ProductDetails = sequelize.define(
    "product_detail",
    {
      cart_desc: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      long_desc: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      img: {
        type: Sequelize.STRING,
        allowNull: true,
      },
    },
    {
      timestamps: true,
      freezeTableName: true,
    }
  );
  return ProductDetails;
};
