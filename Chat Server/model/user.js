const mongoose =require("mongoose");
const Schema=mongoose.Schema;
const userSchema=mongoose.Schema(

    {
        _id:mongoose.Schema.Types.ObjectId,
        firstName:{type:String,unique:true},
        lastName:{type:String,unique:true},
        email:{
            type: String,
            require:true,
            unique:true,
            match: /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

        },
        password:{
            type:String,
            unique:true,

        }
    }) ;

module.exports=mongoose.model('User',userSchema);
