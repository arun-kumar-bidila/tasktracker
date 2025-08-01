const User=require("../models/userModel");
const express=require("express");
const authRouter=express.Router();
const jwt =require("jsonwebtoken");
const bcryptjs=require("bcryptjs");
const auth=require("../middlewares/authMiddleware");



authRouter.post("/api/signup",async(req,res)=>{
    try {
         const {name,userName,password}=req.body;

    const existingUser=await User.findOne({userName});
    if(existingUser){
        res.status(400).json({msg:"UserName already exists"});
    }
    const hashedPassword=await bcryptjs.hash(password,8);

    let newUser=new User({
        name,
        userName,
        password:hashedPassword
    });
    newUser=await newUser.save();
    res.json(newUser);
        
    } catch (e) {
        res.status(500).json({error:e.message});
        
    }
   
});


authRouter.post("/api/signin",async (req,res)=>{
    try {
        const { userName,password}=req.body;

        const user=await User.findOne({userName});

        if(!user){
            res.status(400).json({msg:"User doesn't exist"});
        }

        const isMatch=await bcryptjs.compare(password,user.password);
        if(!isMatch){
            res.status(400).json({msg:"username and password doesn't match"});
        }
        const token=await jwt.sign({id:user._id},"PasswordKey",{expiresIn:"1d"});
        res.json({msg:"Login Successful",token,...user._doc});
    } catch (e) {
        res.status(500).json({error:e.message});
        
    }
});



authRouter.get("/",auth,async(req,res)=>{
    try {
        const user=await User.findById(req.user);
        res.json({token:req.token,...user._doc});
        
    } catch (e) {
        res.status(500).json({error:e.message});
        
    }
});

module.exports=authRouter;