const jwt=require("jsonwebtoken");



const auth=(req,res,next)=>{
    try {
        const token=req.header("authToken");
        if(!token){
            res.status(400).json({msg:"No token provided"});
        }
        const verified=jwt.verify(token,"PasswordKey");
        if(!verified){
            res.status(400).json({msg:"Not token verified token"});
        }
        req.user=verified.id;
        req.token=token;
        next();
        
    } catch (e) {
        res.status(500).json({error:e.message});
        
    }
}

module.exports=auth;