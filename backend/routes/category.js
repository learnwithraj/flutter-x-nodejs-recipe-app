const express = require("express");
const router = express.Router();

const { verifyAdmin } = require("./../middlewares/auth");
const {
  handleGetCategory,
  handleDeleteCategory,
  handleCreateCategory,
  handleUpdateCategory,
  handleGetCategoryById,
} = require("./../controllers/categoryController");

router.post("/", verifyAdmin, handleCreateCategory);
router.put("/:id", verifyAdmin, handleUpdateCategory);
router.delete("/:id", verifyAdmin, handleDeleteCategory);
router.get("/:id", handleGetCategoryById);
router.get("/", handleGetCategory);

module.exports = router;
