const mongoose=require("mongoose");

const taskSchema=mongoose.Schema({
    title:{
        required:true,
        type:String
    },
    description:{
        required:true,
        type:String

    },
    taskDate:{
        required:true,
        type:String

    },
    startTime:{
         type:String,
         default:"Morning"

    },
    endTime:{
        type:String,
        default:"Evening"
    },
    priority:{
        type:String,
        default:"High"
    },
    status:{
        type:String,
        default:"Pending"
    }

},
{
    timestamps:true
});

const Task=mongoose.model("Tasks",taskSchema);
module.exports={Task,taskSchema};