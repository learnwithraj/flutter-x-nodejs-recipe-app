const express = require("express");
const router = express.Router();
const {
  handleGetRecipe,
  handleCreateRecipe,
  handleUpdateRecipe,
  handleDeleteRecipe,
  handleGetRecipeById,
  handleGetAllRecipesByCategory,
} = require("./../controllers/recipeController");

router.get("/", handleGetRecipe);
router.post("/", handleCreateRecipe);
router.put("/:id", handleUpdateRecipe);
router.delete("/:id", handleDeleteRecipe);
router.get("/:id", handleGetRecipeById);
router.get("/:categoryId", handleGetAllRecipesByCategory);

module.exports = router;
