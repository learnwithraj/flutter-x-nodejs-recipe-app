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
} = require("./../controllers/recipeController");

router.get("/", handleGetRecipe);
router.get("/:id", handleGetRecipeById);
router.get("/category/:id", handleGetAllRecipesByCategory);
router.post("/", verifyAdmin, handleCreateRecipe);
router.put("/:id", verifyAdmin, handleUpdateRecipe);
router.delete("/:id", verifyAdmin, handleDeleteRecipe);

module.exports = router;
