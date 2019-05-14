const { Router } = require('express');
const router = Router();

const User = require('../models/User');

const faker = require('faker');

// Create 5 fake users
router.get('/api/users/create', async (req, res) => {
    for (let i = 0; i < 5; i++) {
        await User.create({
            firstName: faker.name.firstName(),
            lastName: faker.name.lastName(),
            avatar:  faker.image.avatar()
        });
    }
    res.json({message: '5 Records created'});
});

// Get all Users
router.get('/api/users', async (req, res) => {
    const users = await User.find();
    res.json({users});
});

module.exports = router;
