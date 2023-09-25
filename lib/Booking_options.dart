import 'package:flutter/material.dart';

class BookingOptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/nextScreen');
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Color(hexColor('#D4CB16')),
                    child: Icon(
                      Icons.cloud_upload,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Book Online',
                    style: TextStyle(
                      fontFamily: 'Montserrat', // Custom font family
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/nextScreen');
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Color(hexColor('#D4CB16')),
                    child: Icon(
                      Icons.create,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Book Manually',
                    style: TextStyle(
                      fontFamily: 'Montserrat', // Custom font family
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


int hexColor(String c){
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}