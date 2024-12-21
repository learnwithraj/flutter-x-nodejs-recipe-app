const User = require("./../models/User");
const { generateToken } = require("./../middlewares/auth");

const handleCreateUser = async (req, res) => {
  const { name, email, password } = req.body;
  try {
    const user = await User.findOne({ email: email });
    if (user) {
      return res
        .status(400)
        .json({ status: false, message: "User already exists" });
    }
    const newUser = new User({
      name,
      email,
      password,
    });

    await newUser.save();
    res
      .status(201)
      .json({ status: true, message: "Account created successfully" });
  } catch (error) {
    return res.status(500).json({ stauts: false, messsage: error.message });
  }
};

const handleLoginUser = async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = await User.findOne(
      { email: email },
      { __v: 0, createdAt: 0, updatedAt: 0 }
    );
    if (!user || !(await user.comparePassword(password))) {
      return res
        .status(400)
        .json({ status: false, message: "Invalid Email or Password" });
    }

    const payload = {
      id: user._id,
      userType: user.userType,
    };
    const userToken = generateToken(payload);

    const { password: _, ...others } = user._doc;

    res.status(200).json({ ...others, userToken });
  } catch (error) {
    return res.status(500).json({ stauts: false, messsage: error.message });
  }
};

const handleGetUser = async (req, res) => {
  const userId = req.user.id;
  try {
    const user = await User.findById(
      {
        _id: userId,
      },
      {
        password: 0,
        __v: 0,
        createdAt: 0,
        updatedAt: 0,
      }
    );

    res.status(200).json(user);
  } catch (error) {
    return res.status(500).json({ stauts: false, messsage: error.message });
  }
};

const handleDeleteUser = async (req, res) => {
  const userId = req.user.id;
  try {
    const user = await User.findById(userId);
    if (!user) {
      return res.status(400).json({ status: false, message: "User not found" });
    }
    await User.findByIdAndDelete(userId);
    res
      .status(200)
      .json({ status: true, message: "Account deleted successfully" });
  } catch (error) {
    return res.status(500).json({ stauts: false, messsage: error.message });
  }
};

const handleUpdateUser = async (req, res) => {
  const userId = req.user.id;
  const { name, email, phone } = req.body;

  try {
    const user = await User.findByIdAndUpdate(
      userId,
      {
        name,
        email,
        phone,
      },
      { new: true, select: "-password -__v -createdAt -updatedAt" }
    );

    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    res
      .status(200)
      .json({ status: true, message: "User Updated Successfully" });
  } catch (error) {
    res.status(500).json({
      status: false,
      message: error.message,
    });
  }
};

module.exports = {
  handleCreateUser,
  handleLoginUser,
  handleGetUser,
  handleDeleteUser,
  handleUpdateUser,
};
