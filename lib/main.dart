import 'package:chat_app/Screens/ChatScreen.dart';
import 'package:chat_app/Screens/Login.dart';
import 'package:chat_app/Screens/Motrimony%20Home%20Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{

  //now in main wwe will check if the user email is present it the key
  //then go to ChatScreen else login screen
  //here in the app when we restart the app it will goto to login  page lets see
  //for this we will take email from key the email is remove from key when the user click logout button else it
  //it present all the time
  //Initialize Firebase
  //Also add multi Dex in the gradle

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref= await SharedPreferences.getInstance();
  //getting email from email key
  var email=pref.getString("email");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //when email is null it got to the login else chatscreen
    //now if we restart it will goto to login page because the email is currently not saved it will save when
    //we register to account or login to account
    //lets see
    //the email is currently empty so that why error come
    //its Occurs due to null safety
    //now  if we restart or close our app then again open app it directly goto chat screen
    //if we logout then restart it goto login page

    home://HomePage(),
    email == null?Login():ChatScreen(),
  ));
}
