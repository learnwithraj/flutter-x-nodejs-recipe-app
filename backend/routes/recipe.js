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
  handleGetPopularRecipes,
  handleGetTrendingRecipes,
  handleGetChefChoiceRecipes,
} = require("./../controllers/recipeController");

router.get("/", handleGetRecipe);
router.get("/:id", handleGetRecipeById);
router.get("/category/:id", handleGetAllRecipesByCategory);
router.post("/", verifyAdmin, handleCreateRecipe);
router.put("/:id", verifyAdmin, handleUpdateRecipe);
router.delete("/:id", verifyAdmin, handleDeleteRecipe);
router.get("/popular/all", handleGetPopularRecipes);
router.get("/trending/all", handleGetTrendingRecipes);
router.get("/chef-choice/all", handleGetChefChoiceRecipes);

module.exports = router;
