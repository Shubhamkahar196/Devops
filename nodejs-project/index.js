import express from 'express'
const app = express();

app.get("/",(req,res)=>{
    res.send("Hello world");
})

app.listen(3000,()=>{
    console.log("Server is running on PORT : 3000 optimization rechecking updating again")
   
})