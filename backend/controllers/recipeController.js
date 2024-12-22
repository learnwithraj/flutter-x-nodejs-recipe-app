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

const handleGetAllIngredients = async (req, res) => {
  try {
    // Using find() instead of aggregate() first to get all recipes
    const recipes = await Recipe.find({}, "ingredients");

    // Extract and flatten ingredients from all recipes
    const allIngredients = recipes.reduce((acc, recipe) => {
      return acc.concat(recipe.ingredients || []);
    }, []);

    // Remove duplicates and format the response
    const uniqueIngredients = Array.from(
      new Set(allIngredients.map((ing) => ing.name))
    )
      .map((name) => {
        const ingredient = allIngredients.find((ing) => ing.name === name);
        return {
          name: ingredient.name,
          amount: ingredient.amount,
          image: ingredient.image || null,
        };
      })
      .sort((a, b) => a.name.localeCompare(b.name));

    return res.status(200).json(uniqueIngredients);
  } catch (error) {
    console.error("Error details:", error);
    return res.status(500).json({
      status: false,
      message: error.message,
    });
  }
};

const handleGetRecipesByIngredients = async (req, res) => {
  try {
    const { ingredient } = req.params;

    if (!ingredient) {
      return res.status(400).json({
        status: false,
        message: "Please provide an ingredient",
        error: "Invalid input",
      });
    }

    // Find recipes that contain the ingredient
    const recipes = await Recipe.find({
      "ingredients.name": {
        $regex: new RegExp(ingredient, "i"), // Case-insensitive search
      },
    }).populate("category");

    if (!recipes.length) {
      return res.status(404).json({
        status: false,
        message: "No recipes found with this ingredient",
      });
    }

    return res.status(200).json(recipes);
  } catch (error) {
    return res.status(500).json({
      status: false,
      message: error.message,
    });
  }
};
module.exports = {
  handleGetRecipe,
  handleCreateRecipe,
  handleUpdateRecipe,
  handleDeleteRecipe,
  handleGetRecipeById,
  handleGetAllRecipesByCategory,
  handleGetAllIngredients,
  handleGetRecipesByIngredients,
};
