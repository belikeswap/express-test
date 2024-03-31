import express from "express";

import { config } from "dotenv";

config();

const PORT = process.env.PORT ?? 3000;

const app = express();
app.use(express.json());

app.get("/", (_, res) => {
	return res.json({ message: "hello world!" });
});

app.listen(PORT, () => {
	console.log(`Listening on ${PORT}!🚀`);
});
