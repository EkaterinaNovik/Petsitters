module.exports = (sequelize, DataTypes) => {
    const Pets = sequelize.define('Pets', {
        id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true,
        },
        type: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        name: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        age: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        breed: {
            type: DataTypes.STRING,
            allowNull: false,
        },

    }, {});
    Pets.associate = function (models) {
        Pets.hasMany(models.Users, {
            foreignKey: 'user_id',
        });
    };
    return Pets;
};