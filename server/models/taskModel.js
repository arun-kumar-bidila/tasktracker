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

    },
    endTime:{
        type:String,
        default:"Today"
    },
    priority:{
        type:String,
        default:"High"
    }

},
{
    timestamps:true
});

const Task=mongoose.model("Tasks",taskSchema);
module.exports={Task,taskSchema};