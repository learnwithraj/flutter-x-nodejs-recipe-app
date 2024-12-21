const Category = require("./../models/Category");

const handleGetCategory = async (req, res) => {
  try {
    const category = await Category.find();
    res.status(200).json(category);
  } catch (error) {
    res.status(500).json({ status: false, message: error.message });
  }
};

const handleDeleteCategory = async (req, res) => {
  const categoryId = req.params.id;
  try {
    const category = await Category.findById(categoryId);
    if (!category) {
      return res
        .status(404)
        .json({ status: false, message: "Category not found" });
    }
    await Category.findByIdAndDelete(categoryId);
    res
      .status(200)
      .json({ status: true, message: "Category deleted successfully" });
  } catch (error) {
    res.status(500).json({ status: false, message: error.message });
  }
};

const handleCreateCategory = async (req, res) => {
  const category = req.body;
  try {
    const newCategory = new Category(category);
    await newCategory.save();
    res
      .status(201)
      .json({ status: true, message: "Category added successfully" });
  } catch (error) {
    res.status(500).json({ status: false, message: error.message });
  }
};

const handleUpdateCategory = async (req, res) => {
  try {
    const category = await Category.find();
    res.status(200).json(category);
  } catch (error) {
    res.status(500).json({ status: false, message: error.message });
  }
};

const handleGetCategoryById = async (req, res) => {
  const categoryId = req.params.id;
  try {
    const category = await Category.findById(categoryId);
    if (!category) {
      return res
        .status(404)
        .json({ status: false, message: "Category not found" });
    }
    res.status(200).json(category);
  } catch (error) {
    res.status(500).json({ status: false, message: error.message });
  }
};

module.exports = {
  handleGetCategory,
  handleDeleteCategory,
  handleCreateCategory,
  handleUpdateCategory,
  handleGetCategoryById,
};
