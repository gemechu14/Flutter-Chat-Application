const router=require("express").Router();
// const User=require("../model/User");
// const bcrypt =require("bcrypt");
 const mongoose  = require("mongoose");

const bycrpt=require("bcrypt");
const User=require("../model/user");

exports.signupNewUser = (req,res,next)=>{
 User.find({email:req.body.email})
 .exec()
 .then(User=>{
     if(User.email>=1){
         return res.status(400).json({
             message:"Email already exist"
         });
     }else{
        bycrpt.hash(req.body.password,10,(err,hash)=>{
            if(err){
                return res.status(500).json({
                    error:err
                })
            }
             else{
                
                const userNew =new  User(

                    {
                   _id: new mongoose.Types.ObjectId(),
                    firstName:req.body.firstName,
                    lastName:req.body.lastName,
                    email:req.body.email,
                    password:hash

                });

                 userNew.save().
                then(
                    result=>{
                        console.log(result);
                        res.status(201).json(
                            {
                                message:"User created successfully...."
                            }
                        );
                    }
                ).catch(err=>{
                    console.log("noooo");
                    res.status(500).json({
                        error:err
                    })
                }

                )
            }
        })
     }
 })
}

