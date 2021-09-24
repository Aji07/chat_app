import 'dart:math';

import 'package:chat_app/Screens/Firebase%20Helper.dart';
import 'package:chat_app/Screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();


  //here we take instance of service class
  Service service = Service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 250),
              Text("Register",
                style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(blurRadius: 02,color: Colors.black),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        //border: OutlineInputBorder(),
                        hintText: "Email id",
                        fillColor: Colors.white,
                        focusColor: Colors.yellow,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(blurRadius: 02,color: Colors.black),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        //border: OutlineInputBorder(),
                        hintText: "Password",
                        fillColor: Colors.white,
                        focusColor: Colors.yellow,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                color: Colors.yellow,
                onPressed: ()async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  //if email and password is not empty it will take action on it
                  if(emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty){
                    service.createUser(context, emailcontroller.text, passwordcontroller.text);

                    //Same thing
                    pref.setString("email", emailcontroller.text);
                  }else{
                    //if textfields are empty it show warning message
                    service.errorBox(context, 'Fields must Not Empty Please Provide Valid email and Password');
                  }
                },
                child: Text("Register",style: TextStyle(fontSize: 15,color: Colors.white),),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                },
                child: Text("Already I have an Account",
                  style: TextStyle(fontSize: 15,color: Colors.black),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
