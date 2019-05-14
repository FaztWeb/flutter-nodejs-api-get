const app = require('./app');
const { connect } = require('./database');

async function main() {
    // Database Connection
    await connect();

    // Express Application
    await app.listen(4000);
    console.log('Server on port 4000: Connected');
};

main();