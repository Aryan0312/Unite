import  { Router } from "express";

export const apiRouter:Router = Router();

apiRouter.get("/signup",(req,res)=>{
    res.json({
        message: "signup"
    })
})

apiRouter.get("/login",(req,res)=>{
    res.json({
        message: "login"
    })
})