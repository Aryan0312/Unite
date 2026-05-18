import express from "express";
import "dotenv/config";
import { apiRouter } from "./routes/v1/index.js";

const app = express();

const PORT = process.env.PORT || 3000;

app.get("/", (req,res) => {
	res.send("welcome to the Unite");
});

app.use("/api/v1",apiRouter);

app.listen(PORT, () => {
	console.log(`http://localhost:${PORT}`);
});
