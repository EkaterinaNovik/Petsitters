module.exports = (sequelize, DataTypes) => {
    const Roles = sequelize.define('Roles', {
        id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true,
        },
        name: {
            type: DataTypes.STRING,
            allowNull: false,
        },
    }, {});
    return Roles;
};