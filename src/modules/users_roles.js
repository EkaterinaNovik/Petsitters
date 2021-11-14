module.exports = (sequelize, DataTypes) => {
    const Users_roles = sequelize.define('Users_roles', {
        id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true,
        },

    }, {});
    Users_roles.associate = function (models) {
        Users_roles.BelongsToMany(models.Roles, {
            foreignKey: 'role_id',
        });
    };
    Users_roles.associate = function (models) {
        Users_roles.BelongsToMany(models.Users, {
            foreignKey: 'user_id',
        });
    };
    return Users_roles;
};