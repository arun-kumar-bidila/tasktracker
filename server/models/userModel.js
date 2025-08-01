const mongoose = require("mongoose");
const { taskSchema } = require("./taskModel");

const userSchema = mongoose.Schema({

    name: {
        type: String,
        required: true,


    },

    userName: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true
    },
    userTasks:[
        taskSchema
    ]


}
    ,
    {
        timestamps: true
    });

const User = mongoose.model("User", userSchema);

module.exports = User;