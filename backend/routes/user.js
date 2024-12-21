const express = require("express");
const router = express.Router();

const { verifyAndAuthorize } = require("./../middlewares/auth");
const {
  handleCreateUser,
  handleLoginUser,
  handleGetUser,
  handleDeleteUser,
  handleUpdateUser,
} = require("./../controllers/userController");

router.post("/register", handleCreateUser);
router.post("/login", handleLoginUser);
router.put("/", verifyAndAuthorize, handleUpdateUser);
router.delete("/", verifyAndAuthorize, handleDeleteUser);
router.get("/", verifyAndAuthorize, handleGetUser);

module.exports = router;
