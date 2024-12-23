const Recipe = require("./../models/Recipe");
const Category = require("./../models/Category");

const handleGetRecipe = async (req, res) => {
  try {
    const recipes = await Recipe.find(
      {},
      { __v: 0, createdAt: 0, updatedAt: 0 }
    );
    res.status(200).json(recipes);
  } catch (error) {
    res.status(500).json({ status: false, message: error.message });
  }
};

const handleCreateRecipe = async (req, res) => {
  const recipe = req.body;
  try {
    const newRecipe = new Recipe(recipe);
    await newRecipe.save();
    res
      .status(201)
      .json({ status: true, message: "Recipe added successfully" });
  } catch (error) {
    res.status(500).json({ status: false, message: error.message });
  }
};

const handleUpdateRecipe = async (req, res) => {
  const id = req.params.id;
  const data = req.body;
  try {
    const recipe = await Recipe.findById(id);
    if (!recipe) {
      return res.status(404).json({ message: "Recipe not Found" });
    }
    const updatedRecipe = await Recipe.findByIdAndUpdate(
      id,
      { $set: data },
      { new: true, runValidators: true }
    );

    if (!updatedRecipe) {
      return res
        .status(200)
        .json({ status: false, message: "Recipe item not updated " });
    }
    res
      .status(200)
      .json({ status: true, message: "Recipe updated successfully" });
  } catch (error) {
    res.status(500).json({ status: false, message: error.message });
  }
};

const handleDeleteRecipe = async (req, res) => {
  const id = req.params.id;
  try {
    const recipe = await Recipe.findById(id);
    if (!recipe) {
      return res.status(404).json({ message: "Recipe not Found" });
    }
    await Recipe.findByIdAndDelete(id);
    res
      .status(200)
      .json({ status: true, message: "Recipe deleted successfully" });
  } catch (error) {
    res.status(500).json({ status: false, message: error.message });
  }
};

const handleGetRecipeById = async (req, res) => {
  const id = req.params.id;

  try {
    const recipe = await Recipe.findById(id, { __v: 0 });
    if (!recipe) {
      return res.status(404).json({ message: "Recipe item not found" });
    }

    res.status(200).json(recipe);
  } catch (error) {
    res.status(500).json({ status: false, message: error.message });
  }
};

const handleGetAllRecipesByCategory = async (req, res) => {
  const categoryId = req.params.id;

  try {
    const category = await Category.findById(categoryId);
    if (!category) {
      return res.status(404).json({ message: "Category not found" });
    }

    const recipes = await Recipe.find(
      {
        category: categoryId,
      },
      { __v: 0, createdAt: 0, updatedAt: 0 }
    ).populate("category", { __v: 0, createdAt: 0, updatedAt: 0 });

    if (!recipes.length) {
      return res.status(404).json({
        status: false,
        message: `No recipes found for category ${category.title}`,
      });
    }

    res.status(200).json(recipes);
  } catch (error) {
    res.status(500).json({ status: false, message: error.message });
  }
};


const handleGetPopularRecipes = async (req, res) => {
  const limit = parseInt(req.query.limit) || 10; // Default limit to 10

  try {
    // Fetch all recipes sorted by rating and reviews in descending order
    const popularRecipes = await Recipe.find(
      {},
      { __v: 0, createdAt: 0, updatedAt: 0 }
    )
      .sort({ rating: -1, reviews: -1 }) // Sort by rating and reviews
      .limit(limit) // Limit the number of results
      .populate("category", { __v: 0, createdAt: 0, updatedAt: 0 }); // Populate category details if needed

    if (!popularRecipes.length) {
      return res.status(404).json({
        status: false,
        message: "No popular recipes found",
      });
    }

    res.status(200).json(popularRecipes);
  } catch (error) {
    res.status(500).json({ status: false, message: error.message });
  }
};

const handleGetTrendingRecipes = async (req, res) => {
  try {
    // Fetch trending recipes based on multiple factors such as rating, reviews, calorie, time, and image.
    const trendingRecipes = await Recipe.find()
      .sort({ rating: -1, reviews: -1, calorie: -1, time: 1, createdAt: 1 }) // Sort by rating, reviews (desc), calorie (desc), and time (asc)
      .limit(5)
      .populate("category");

    if (!trendingRecipes.length) {
      return res
        .status(404)
        .json({ status: false, message: "No trending recipes found" });
    }

    return res.status(200).json(trendingRecipes);
  } catch (error) {
    return res.status(500).json({ status: false, message: error.message });
  }
};

const handleGetChefChoiceRecipes = async (req, res) => {
  try {
    // Fetch trending recipes based on multiple factors such as rating, reviews, calorie, time, and image.
    const masterChefsChoice = await Recipe.find({})
      .sort({
        rating: -1, // Sort by rating in descending order
        reviews: -1, // Sort by reviews in descending order
        time: 1, // Sort by time in ascending order (shorter time first)
        calorie: 1, // Sort by calorie in ascending order (lower calories first)
        createdAt: -1, // Sort by creation date (newest first)
      })
      .limit(5)
      .populate("category");

    if (!masterChefsChoice.length) {
      return res
        .status(404)
        .json({
          status: false,
          message: "No Master Chef's choice recipes found",
        });
    }

    return res.status(200).json(masterChefsChoice);
  } catch (error) {
    return res.status(500).json({ status: false, message: error.message });
  }
};

module.exports = {
  handleGetRecipe,
  handleCreateRecipe,
  handleUpdateRecipe,
  handleDeleteRecipe,
  handleGetRecipeById,
  handleGetAllRecipesByCategory,
  handleGetPopularRecipes,
  handleGetTrendingRecipes,
  handleGetChefChoiceRecipes
};
