module.exports = (sequelize, DataTypes) => {
    const Users = sequelize.define('Users', {
        id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true,
        },
        start_date: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        end_date: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        payment: {
            type: DataTypes.INTEGER
        },

    }, {});
    Users.associate = function (models) {
        Users.hasMany(models.Roles, {
            foreignKey: 'role_id',
        });
    };
    return Users;
};