import 'package:chat_app/Screens/ChatScreen.dart';
import 'package:chat_app/Screens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class Service{
  //in service class we done all Firebase Auth
  final auth = FirebaseAuth.instance;

  //for create User we define function
  //CreateUser takes 3 Parameters context,email,password
  void createUser(context,email,password)async{
    try{
      //When the user Create it will go to chat screen directly not to login page
      await auth
          .createUserWithEmailAndPassword(email: email, password: password )
          .then((value) =>{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()))
      });
    }catch(e){
      //if it has some error the it will show dialogue
      errorBox(context, e);
    }
  }


  //for login user we define login user function
void loginUser(context,email,password)async{
    try{
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen())),
      });
    }catch(e){
      //if it has some error then it will show dialogue
      errorBox(context, e);
    }
}

//for signout
void signOut(context)async{

    try{
      //this function helps to signout User
      await auth.signOut().then((value) => {
        print('Clear.............'),
        BlendMode.clear,
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()),
                (route) => false)
      });
    }catch(e){
      //if it has some error then it will show dialogue
      errorBox(context, e);
    }
}



//for display error we define errorBox function
void errorBox(context,e){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Error"),
        content: Text(e.toString()),
      );
    });
}
}




