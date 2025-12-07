import express from 'express';
import { PrismaClient } from './generated/prisma/client.js';


const app = express();

const prismclient = new PrismaClient();

app.get("/",async (req,res)=>{
   
    const data = await prismclient.user.findMany();
    res.json({
        data
    })
})

app.post("/", async(req,res)=>{
     await prismclient.user.create({
        data: {
            username: Math.random().toString(),
            password: Math.random().toString()
        }
    })
    res.json({
        "message": "post endpoint"
    })
})
app.listen(3000,()=>{
    console.log('server is running on 3000')
})