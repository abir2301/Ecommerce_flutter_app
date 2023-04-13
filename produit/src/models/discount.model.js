module.exports = (sequelize, Sequelize) => {
  const Discount = sequelize.define(
    "discount",
    {
      name: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      desc: {
        type: Sequelize.TEXT,
        allowNull: true,
      },
      percent: {
        type: Sequelize.FLOAT,
        defaultValue: 0.0,
      },
      date_creation: {
        type: Sequelize.DATE,
        defaultValue: Sequelize.NOW,
      },
      //mm//dd//yyyy
      date_limit: {
        type: Sequelize.DATE,
        defaultValue: Sequelize.NOW,
      },
    },
    {
      timestamps: true,
      freezeTableName: true,
    }
  );
  return Discount;
};
