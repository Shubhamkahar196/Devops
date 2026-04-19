import { configDotenv } from 'dotenv';
import express, { Request, Response } from 'express';
configDotenv();
const app = express();
const port = process.env.PORT;

app.get("/", (req: Request, res: Response) => {
    res.send("hiii");
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});