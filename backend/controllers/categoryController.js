const Category = require("./../models/Category");

const handleGetCategory = async (req, res) => {
  try {
    const category = await Category.find(
      {},
      { __v: 0, createdAt: 0, updatedAt: 0 }
    );
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
  const id = req.params.id;
  const { title, value, image } = req.body;
  try {
    const category = await Category.findById(id);
    if (!category) {
      return res.status(404).json({ message: "Category not Found" });
    }
    await Category.findByIdAndUpdate(id, {
      title: title,
      value: value,
      image: imageUrl,
    });
    cache.flushAll();
    res
      .status(200)
      .json({ status: true, message: "Category updated successfully" });
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
