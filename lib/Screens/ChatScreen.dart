import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Screens/Firebase%20Helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class ChatScreen extends StatefulWidget {
  //const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Service service = Service();
  final storeMessage = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  TextEditingController msg = TextEditingController();

  getCurrentUser(){
    final user = auth.currentUser;
    //if user not empty it assign to login user
    if(user!=null){
      loginUser=user;
    }
  }

  @override
  void initstate(){
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: ()async{
              service.signOut(context);
              //now here we remove that email from the key when user click logout button
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.remove("email");
              //it will remove user email when user click logout button
            },
            icon: Icon(Icons.logout),
          ),
        ],
        title: Text(loginUser!.email.toString(),
          style: TextStyle(fontSize: 15,color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              height: 500,
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                    reverse: true,
                    child: ShowMessages(),
                ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child:Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.black,width: 1
                      ),
                    ),
                  ),
                child: TextField(
                  controller: msg,
                  decoration: InputDecoration(
                    hintText: "Enter Message...",
                  ),
                ),
              ),
              ),
              IconButton(
                onPressed: (){
                  if(msg.text.isNotEmpty){
                    storeMessage.collection("Messages").doc().set
                      ({
                      "messages":msg.text.trim(),
                      "user":loginUser!.email.toString(),
                      "time":DateTime.now(),
                    });
                    msg.clear();
                  }
                },
                icon: Icon(Icons.send),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class ShowMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
      .collection("Messages")
      .orderBy("time")
          .snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          //reverse: true,
          itemCount: snapshot.data!.docs.length,
          shrinkWrap: true,
            primary: true,
            physics: ScrollPhysics(),
            itemBuilder: (context,i){
          QueryDocumentSnapshot x  = snapshot.data!.docs[i];
          return ListTile(
            title: Column(
              //if user is as self then text show in the end
              //else other user chat show in start
              crossAxisAlignment: loginUser!.email == x['user']
                ?CrossAxisAlignment.end
              :CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  decoration: BoxDecoration(
                    color: loginUser!.email==x['user']
                        ?Colors.blue.withOpacity(0.3)
                        :Colors.green.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                    child: Column(
                      children: [
                        Text(x['messages'],style: TextStyle(fontSize: 15,color: Colors.black),),
                        Text(x['user'],style: TextStyle(fontSize: 14,color: Colors.black54),),
                      ],
                    ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
