require("dotenv").config();
const express = require("express");
const app = express();
const cors = require("cors");
const mongoose = require("mongoose");

const PORT = process.env.PORT || 4000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());

// routes
const userRoutes = require("./routes/user");
const recipeRoutes = require("./routes/recipe");
const categoryRoutes = require("./routes/category");

app.use("/api/users", userRoutes);
app.use("/api/recipes", recipeRoutes);
app.use("/api/categories", categoryRoutes);

//connection of mongodb
mongoose
  .connect(process.env.MONGO_URL)
  .then(() => {
    console.log("MongoDB connected!");
  })
  .catch((e) => {
    console.log(e);
  });

//starting server on port
app.listen(PORT, () => {
  console.log(`Server connected in ${PORT}`);
});
