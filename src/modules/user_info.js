module.exports = (sequelize, DataTypes) => {
    const User_info = sequelize.define('User_info', {
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
        image: {
            type: DataTypes.STRING,
            allowNull: false,
        },

        gender: {
            type: DataTypes.ENUM('m', 'f'),

        },
        birthday: {
            type: DataTypes.DATE,

        },
        phone: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        address: {
            type: DataTypes.STRING,
            allowNull: false,
        },


    }, {});
    User_info.associate = function (models) {
        User_info.hasMany(models.Users, {
            foreignKey: 'user_id',
        });
    };
    return User_info;
};