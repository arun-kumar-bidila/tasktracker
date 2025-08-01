const mongoose=require("mongoose");
const express=require("express");
require("dotenv").config();


const authRouter=require("./routes/authRouter");
const userRouter = require("./routes/userRouter");


const app=express();

app.use(express.json());
app.use(authRouter);
app.use(userRouter);

mongoose.connect(process.env.MONGO_URI,{useNewUrlParser:true,useUnifiedTopology:true}).then(()=>{
    console.log("Database connected successfull");
}).catch((e)=>{
    console.error("Database connection error:",e);
});

app.listen(process.env.PORT,"0.0.0.0",()=>{
    console.log(`Server started at port ${process.env.PORT}`);
});