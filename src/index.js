import express from "express";
import cors from "cors";
import bodyParser from "body-parser";
import "dotenv/config";

const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.json({
    message: "Hello ExpressJS!",
  });
});

app.listen(port, () => {
  console.log(`app is listening to port ${port}`);
});
