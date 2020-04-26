const { environment } = require('@rails/webpacker')
const setupAdminos = require('adminos/webpacker');

setupAdminos(environment);

module.exports = environment
