const express = require("express");
const router = express.Router();
const { verifyAdmin } = require("./../middlewares/auth");
const {
  handleGetRecipe,
  handleCreateRecipe,
  handleUpdateRecipe,
  handleDeleteRecipe,
  handleGetRecipeById,
  handleGetAllRecipesByCategory,
  handleGetAllIngredients,
  handleGetRecipesByIngredients,
} = require("./../controllers/recipeController");

router.get("/", handleGetRecipe);
router.get("/:id", handleGetRecipeById);
router.get("/category/:id", handleGetAllRecipesByCategory);
router.post("/", verifyAdmin, handleCreateRecipe);
router.put("/:id", verifyAdmin, handleUpdateRecipe);
router.delete("/:id", verifyAdmin, handleDeleteRecipe);
router.get("/ingredients/all", handleGetAllIngredients);
router.get("/ingredients/all/recipes/:ingredient", handleGetRecipesByIngredients);

module.exports = router;
