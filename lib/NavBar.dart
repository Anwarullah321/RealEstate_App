import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:realestateapp/main.dart';
import 'package:realestateapp/utils/utils.dart';

class NavBar extends StatelessWidget {
  Utils utils = Utils();
  final User? user;
  NavBar({this.user});


   final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: CircleAvatar(
                  radius: 50,

                  backgroundImage: AssetImage('Images/plot1.jpg'),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  '${user?.displayName ?? 'name'}',

                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  user?.email ?? 'user@example.com',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: IconTheme(
                  data: IconThemeData(
                    size: 30,
                    color: Colors.black45

                  ),

               child: Icon(Icons.home),),
                title: Text('HOME',
                style: TextStyle(
                  fontSize: 15,

                ),
                ),
                onTap: () {
                  Navigator.pop(
                    context,

                  );
                },
              ),
              ListTile(
                leading: IconTheme(
                  data: IconThemeData(
                     size: 30,
                  color: Colors.black45
                  ),
                  child: Icon(Icons.call),),
                title: Text('CONTACTS',
                  style: TextStyle(
                    fontSize: 15
                  ),

                ),
                onTap: (){

                },
              ),
              ListTile(
                leading: IconTheme(
                  data: IconThemeData(
                    size: 30,
                    color: Colors.black45
                  ),
                 child: Icon(Icons.location_on),),
                title: Text('LOCATION',
                style: TextStyle(
                  fontSize: 15
                ),
                ),
                onTap: (){

                },
              ),

              ListTile(
                leading: IconTheme(
                  data: IconThemeData(
                size: 30,
                    color: Colors.black45
                  ),
                  child: Icon(Icons.settings),),
                title: Text('SETTINGS',
                style: TextStyle(
                  fontSize: 15
                ),),
                onTap: () {
                  // Handle Settings option tap
                },
              ),
              ListTile(
                leading: IconTheme(
                  data: IconThemeData(
                    size: 30,
                    color: Colors.black45
                  ),
                  child: Icon(Icons.help_outline),),
                  title: Text('FAQS',
                  style: TextStyle(
                    fontSize: 15
                  )),
                onTap: (){

                },
              ),
              ListTile(
                leading: IconTheme(
                  data: IconThemeData(
                    size: 30,
                    color: Colors.black45
                  ),
                child: Icon(Icons.help_center),),
                title: Text('HELP AND SUPPORT',
                  style: TextStyle(
                    fontSize: 15
                  ),),
                onTap: (){

                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                leading: IconTheme(
                data: IconThemeData(
                  size: 30,
                  color: Colors.black45
                ),
                child: Icon(Icons.logout),),
                title: Text('LOGOUT',
                style: TextStyle(
                  fontSize: 15
                ),
                ),
                onTap: () {
                  auth.signOut().then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp())
                    );
                  }).onError((error, stackTrace){
                    utils.toastMessage(error.toString());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );

  }
}
