const express = require("express");
const auth = require("../middlewares/authMiddleware");
const { Task } = require("../models/taskModel");
const userRouter = express.Router();
const User = require("../models/userModel");



userRouter.post("/api/create-task", auth, async (req, res) => {
    try {

        const { title, description, taskDate, startTime, endTime, priority , status } = req.body;
        const user = await User.findById(req.user);

        if (!user) {
            return res.status(404).json({ error: "User not found" });
        }

        const task = {
            title, description, taskDate, startTime, endTime, priority ,status
        };
        user.userTasks.push(task);

        await user.save();
        res.json({user,msg:"Task Created successfully"});

    } catch (e) {
        res.status(500).json({ error: e.message });

    }
});

userRouter.post("/api/fetch-tasks-on-date", auth, async (req, res) => {
    try {

        const { taskDate } = req.body;
        const user = await User.findById(req.user);
        if (!user) {
            return res.status(404).json({ error: "User not found" });
        }


        const tasksOnDate = user.userTasks.filter(task => task.taskDate === taskDate);

        res.json(tasksOnDate);

    } catch (e) {

        res.status(500).json({ error: e.message });


    }
});

userRouter.post("/api/update-task-status",auth,async(req,res)=>{
    try {

        const { taskId, status } = req.body;
        const user=await User.findById(req.user);

        const task=await user.userTasks.id(taskId);

      if(!task){
        res.status(400).json({msg:"Task not found"});

      }

      task.status=status;
      await user.save();
      res.json({msg:"Task status updated"});
        
    } catch (e) {
         res.status(500).json({ error: e.message });

        
    }
});

userRouter.post("/api/edit-task",auth,async(req,res)=>{
    try {

        const{taskId,title, description, taskDate, startTime, endTime, priority}=req.body;
        const user=await User.findById(req.user);

        const task=user.userTasks.id(taskId);

        task.title=title;
        task.description=description;
        task.taskDate=taskDate;
        task.startTime=startTime;
        task.endTime=endTime;
        task.priority=priority;
        
    await user.save();
        res.json({msg:"Task updated Successfully"});


        
    } catch (e) {
         res.status(500).json({ error: e.message });
        
    }

});

module.exports = userRouter;