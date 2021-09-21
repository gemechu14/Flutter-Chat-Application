// const express=require("express");
// var http=require("http");
// const port = process.env.port || 5000;
//  const app=express();

//  var server=http.createServer(app);
//  var io=require("socket.io")(server);

  
const express = require("express");
var http = require("http");
const app = express();
const port = process.env.PORT || 1000;
var server = http.createServer(app);
var io = require("socket.io")(server); 
const bodyparser=require("body-parser")  ; 
const morgan = require("morgan");
const mongoose=require("mongoose");
const bycrpt=require("bcrypt");

const userRoute=require("./routes/user");  

 //middleware 


app.use(bodyparser?.urlencoded({extended :false}))
app.use(bodyparser.json());
app.use(morgan("dev"))

app.use((req,res,next)=>{

  res.header("Access-Control-Allow-Origin","*");
  res.header("Access-Control-Allow-Header","Origin,X-Requested-With,Context-Type,Accept, Authorization");
 if(req.method==="OPTIONS"){
   res.header("Access-Control-Allow-Method","PUT,POST,PATCH,DELETE,GET");
   return res.status(200).json({})
  }
next();
});

 app.use(express.json());

 app.use("/api/user",userRoute);

 app.use((req,res,next)=>{
   const error=new Error("Not found");
   error.status = 400;
   next(error);
 });

 app.use((error,req,res,next)=>{
   res.status(error.status || 500);
   res.json({
     error:{
       message: error.message
     }
   });
   
 });



 var client={};
 
 io.on("connection",(socket) =>{
     console.log("Connected");
    
    
     socket.on("message",(msg)=>{
      console.log(msg);
      let targetId=msg.targetId;
      if(client[targetId])
      client[targetId].emit("message",msg);

      
    });
   

     console.log(socket.id, "has joined");
     socket.on("signin", (id) => {
       client[id]=socket;
       console.log(client);
       
     });

 });

 server.listen(port, "0.0.0.0", () => {
    console.log("server  hhh started" +port );
  });
  
mongoose.connect("mongodb://127.0.0.1:27017/ttms", 

  {   useNewUrlParser: true, 
      useUnifiedTopology: true,
      useCreateIndex:true,
      useFindAndModify:true
  }).then(console.log("connected to mongodb"))
  .catch((error)=>console.log(console.log(error)));