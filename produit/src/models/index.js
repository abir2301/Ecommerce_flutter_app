const { Sequelize, DataTypes } = require("sequelize");
require("dotenv").config();

const sequelize = new Sequelize(
  process.env.DB_DATABASE,
  process.env.DB_USERNAME,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    dialect: process.env.DB_CONNECTION,
  }
);

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;
db.product = require("./product.model")(sequelize, Sequelize);
db.product_discount = require("./product_discount.model")(sequelize, Sequelize);
db.productDetail = require("./product_details.model")(sequelize, Sequelize);
db.category = require("./category.model")(sequelize, Sequelize);
db.discount = require("./discount.model")(sequelize, Sequelize);

db.product.hasOne(db.productDetail, { onDelete: "CASCADE" });
db.productDetail.belongsTo(db.product, { onDelete: "CASCADE" });
db.category.hasMany(db.product);
db.product.belongsTo(db.category);
db.discount.belongsToMany(db.product, { through: db.product_discount });
db.product.belongsToMany(db.discount, { through: db.product_discount });
// db.users.belongsToMany(db.hp, { through: db.userHp });
// db.hp.belongsToMany(db.users, { through: db.userHp });

module.exports = db;
