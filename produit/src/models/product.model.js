module.exports = (sequelize, Sequelize) => {
  const Product = sequelize.define(
    "product",
    {
      name: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      price: {
        type: Sequelize.INTEGER,
        default: 0,
      },
    },
    {
      timestamps: true,
      freezeTableName: true,
    }
  );
  return Product;
};
