module.exports = (sequelize, Sequelize) => {
  const ProductDiscount = sequelize.define(
    "product_discount",
    {},
    {
      timestamps: true,
      freezeTableName: true,
    }
  );
  return ProductDiscount;
};
