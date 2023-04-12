module.exports = (sequelize, Sequelize) => {
  const Category = sequelize.define(
    "category",
    {
      name: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      desc: {
        type: Sequelize.STRING,
        allowNull: true,
      },
    },
    {
      timestamps: true,
      freezeTableName: true,
    }
  );
  return Category;
};
