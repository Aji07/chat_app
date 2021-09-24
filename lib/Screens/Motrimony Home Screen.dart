import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: PreferredSize(
       preferredSize: Size.fromHeight(100),
       child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 15,left: 25),
            child: Text("Home",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
                gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  Colors.blue,
                  Colors.cyanAccent,
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.notifications,color: Colors.black,size: 25),
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 15,right: 15),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.headset,color: Colors.black,size: 25),
              ),
            ),
          ],
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
           bottomLeft: Radius.circular(50),
           bottomRight: Radius.circular(50),
         )),
         elevation: 0,
        ),
     ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.person,size: 25,color: Colors.black,),
                Text("Your Profile is\npending verification!",
                style: TextStyle(fontSize: 15,color: Colors.black),),
                FlatButton(
                  color: Colors.grey,
                  onPressed: (){},
                  child: Text("Verify Now",style: TextStyle(fontSize: 15,color: Colors.black),),
                ),
              ],
            ),
            SizedBox(height: 15),
            Center(
              child: Text("A Quick look back on your journey so far",
              style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 10),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 10),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 10),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
