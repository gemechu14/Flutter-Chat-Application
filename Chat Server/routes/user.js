const express=require("express");
const router=express.Router();
const userController=require('../controllers/user');


//Signup URL
router.post("/signup",userController.signupNewUser);
module.exports=router;