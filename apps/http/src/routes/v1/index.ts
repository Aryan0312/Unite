import  { Router } from "express";
import { userRouter } from "./user.js";
import { spaceRouter } from "./space.js";
import { adminRouter } from "./admin.js";

export const apiRouter:Router = Router();

apiRouter.post("/signup",(req,res)=>{
    res.json({
        message: "signup"
    })
})

apiRouter.post("/login",(req,res)=>{
    res.json({
        message: "login"
    })
})

apiRouter.get("/elements",(req,res)=>{
    
})

apiRouter.get("/avatars",(req,res)=>{
    
})

apiRouter.use("/users",userRouter);

apiRouter.use("/space",spaceRouter);

apiRouter.use("/admin",adminRouter);