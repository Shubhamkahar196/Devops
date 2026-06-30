import express from 'express';

// import { PrismaClient } from '../generated/prisma/client';
import { prisma } from '../lib/prisma.js';

const app = express();
const PORT = 3000;
app.use(express.json());


// GET: Fetch all users from the PostgreSQL database
app.get("/", async (req, res) => {
    try {
        const data = await prisma.user.findMany();
        res.json({
            success: true,
            data
        });
    } catch (error) {
        console.error("Error fetching users:", error);
        res.status(500).json({ success: false, error: "Internal Server Error" });
    }
});

// POST: Create a user using a random string template matching your schema fields
app.post("/", async (req, res) => {
    try {
        const newUser = await prisma.user.create({
            data: {
                username: `user_${Math.random().toString(36).substring(7)}`,
                password: Math.random().toString(36).substring(2)
            }
        });
        
        res.json({
            success: true,
            message: "User created successfully",
            user: { id: newUser.id, username: newUser.username }
        });
    } catch (error) {
        console.error("Error creating user:", error);
        res.status(500).json({ success: false, error: "Internal Server Error" });
    }
});

// Start the Express Server

app.listen(PORT, () => {
    console.log(`🚀 Server running smoothly on http://localhost:${PORT}`);
});