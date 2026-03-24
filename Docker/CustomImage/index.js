import express from 'express';

const app = express();
const PORT = 8000;

app.get("/", (req, res) => {
  return res.json({
    status: "Success",
    message: "Hello from express server",
  });
});

app.listen(PORT,()=>{
    console.log(`Server is running on ${PORT}`)
})