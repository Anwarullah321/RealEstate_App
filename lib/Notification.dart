import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color appBarColor = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(


        appBar: customAppBar(context, appBarColor),



      body: Stack(
        children: [



        ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SvgPicture.asset('Icons/NIcon.svg'),
            title: Text('New login aLert'),
            subtitle: Text('Details about notification $index'),
            onTap: () {
              // Handle notification tap
            },
          );
        },
      ),
  ]));
  }
}

AppBar customAppBar(BuildContext context, Color appBarColor) {
  return AppBar(
    foregroundColor: Colors.black,
    backgroundColor: appBarColor,
    elevation: 0,
    title: Padding(
      padding: const EdgeInsets.only(left: 20, top: 5),
      child: Text(
        'Notifications',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    ),
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, top: 5),
        child: SvgPicture.asset(
          'Icons/Regular/Back.svg',
        ),
      ),
    ),
    actions: [
      Padding(

        padding: const EdgeInsets.only(left: 10.0),
        child: IconButton(
          icon: SvgPicture.asset(
            'Icons/Markall.svg',
          ),

          onPressed: () {

          },
        ),
      ),
    ],

  );
}

void main() {
  runApp(MaterialApp(
    home: NotificationScreen(),
  ));
}
