import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realestateapp/Detail_page.dart';
import 'package:realestateapp/Diverse.dart';
import 'package:realestateapp/LogIn.dart';
import 'package:realestateapp/Notification.dart';
import 'package:realestateapp/Regular.dart';
import '../Booking_options.dart';
import '../Resellers/Resellers.dart';
import '../models/catalog.dart';
import 'package:firebase_core/firebase_core.dart';

import '../NavBar.dart';
import '../models/catalog.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../sellproperties/SellProperties.dart';

class PropertyWidget extends StatefulWidget{



  @override
  State<PropertyWidget> createState() => _PropertyWidgetState();
}

class _PropertyWidgetState extends State<PropertyWidget> {
  int myIndex = 0;
  bool showLabels = false;
  int selectedIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('plots');


  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  int notificationCount = 2;

  void incrementNotificationCount() {
    setState(() {
      notificationCount++;
    });
  }

  double calculatePadding(int count) {
    if (count < 10) {
      return 3.0; // Adjust this value for small counts
    } else if (count < 100) {
      return 3.0; // Adjust this value for medium counts
    } else {
      return 6.0; // Adjust this value for large counts
    }
  }



  @override

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    //List<UserModel> users = initializeUserData();

    return Scaffold(

      key: _scaffoldKey,
      drawer: NavBar(user: user),

      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),


        child: Stack(

          children: [

            Container(

                width: MediaQuery.of(context).size.width*1,
                height: MediaQuery.of(context).size.height*0.03,
                color: Color(hexColor('#F0B90B'))
            ),
            Expanded(
              child: Container(


                child: SvgPicture.asset('Icons/backdesign.svg',
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4),
              ),),
            Positioned(
              top: 25,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: _openDrawer,
              ),
            ),
            Positioned(
              top: 25,
              right: 10,
              child: Stack(
                children: [

                  IconButton(
                    icon: Icon(Icons.notifications_none),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationScreen ()),
                      );
                    },
                  ),
                  if (notificationCount > 0)
                    Positioned(
                      top: 5,
                      right: 13,
                      child: ClipOval(
                        child: Container(
                          padding: EdgeInsets.all(calculatePadding(notificationCount)),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '$notificationCount',
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                ],
              ),
            ),

            Column(

              children: [
                Row(

                  children: [
                    Container(

                      margin: EdgeInsets.only(left: 39),


                      child:Column(

                          children: [

                            SizedBox(height: 86),

                            SvgPicture.asset('Icons/news.svg'),
                            SizedBox(height: 7),
                            Text('News',style: TextStyle(
                                fontFamily: 'Arial',fontSize: 12
                            ),),

                          ]),),


                    GestureDetector(
                      onTap: () {
                        // Add navigation logic here to navigate to the next screen
                        // For example, you can use the Navigator class:
                      Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) => Regular_Listings()
                            )
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 45),
                        child: Column(
                          children: [
                            SizedBox(height: 100),
                            SvgPicture.asset('Icons/buyproperties.svg'),
                            SizedBox(height: 7),
                            Text(
                              '     Buy\nProperties',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //margin: EdgeInsets.only(left: 35),
                    GestureDetector(
                      onTap: () {

                          Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) => SellProperties()
                            )
                        );
                      },
                   child: Container(

                      margin: EdgeInsets.only(left:35),
                      child:Column(
                          children: [

                            SizedBox(height: 100),
                            SvgPicture.asset('Icons/sellproperties.svg'),
                            SizedBox(height: 7),
                            Text('     Sell\n'
                                'Properties',style: TextStyle(
                                fontFamily: 'Arial',fontSize: 12
                            ),),

                          ]),),),
                    Expanded(child: Container(

                        margin: EdgeInsets.only(left: 30),
                        child: Column(
                            children: [

                              SizedBox(height: 86),
                              SvgPicture.asset('Icons/Development.svg'),
                              SizedBox(height: 7),
                              Text('Development',style: TextStyle(
                                  fontFamily: 'Arial',fontSize: 12
                              ),),
                            ])),),

                  ],),
                Transform.translate(
                  offset: Offset(0, -5),

                  child: Row(

                    children: [
    GestureDetector(
    onTap: () {

            Navigator.push(context, MaterialPageRoute(builder:
            (context) => Reseller_Listings ()));
            },
            child: Container(
                        margin: EdgeInsets.only(left: 33.5),


                        child:Column(

                            children: [
                              SizedBox(height: 13),
                              SvgPicture.asset('Icons/Resellers.svg'),
                              SizedBox(height: 7),
                              Text('Resellers',style: TextStyle(
                                  fontFamily: 'Arial',fontSize: 12
                              ),),

                            ]

                        ),),),


                      Container(
                        margin: EdgeInsets.only(left:30.8),

                        child:Column(
                            children: [

                              SizedBox(height: 13),
                              SvgPicture.asset('Icons/Sales Launch.svg'),
                              SizedBox(height: 7),
                              Text('Sales Launch'
                                ,style: TextStyle(
                                    fontFamily: 'Arial',fontSize: 12
                                ),),

                            ]),),
                      //margin: EdgeInsets.only(left: 35),
                      Container(

                        margin: EdgeInsets.only(left:33),
                        child:Column(
                            children: [

                              SizedBox(height: 13),
                              SvgPicture.asset('Icons/More.svg'),
                              SizedBox(height: 7),
                              Text('More',style: TextStyle(
                                  fontFamily: 'Arial',fontSize: 12
                              ),),

                            ]),),


                    ],),),
                SizedBox(height: 60),

                Expanded(
                  child: ListView(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'About',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on, color: Colors.yellow),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  '123 Main Street',
                                  style: TextStyle(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.phone, color: Colors.yellow),
                              SizedBox(width: 8.0),
                              Text('555-555-5555'),
                            ],
                          ),
                        ),

                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.phone, color: Colors.yellow),
                              SizedBox(width: 8.0),
                              Text('---------------'),
                            ],
                          ),
                        ),
                      ],
                    ),



                    SizedBox(height: 25),


                    SizedBox(

                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.034,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.85),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.16),
                              offset: Offset(2, 2),
                              blurRadius: 0,
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.16),
                              offset: Offset(-2, -2),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Newly Listed Plots',
                            style: TextStyle(
                              fontFamily: 'ArialNB',
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.60),
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),



                    SizedBox(height: 20),


                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: StreamBuilder<DatabaseEvent>(
                          stream: ref.onValue,
                          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }

                            if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            }

                            if (!snapshot.hasData || snapshot.data?.snapshot.value == null) {
                              return Center(child: Text('No data available'));
                            }
                            if (snapshot.hasData) {

                              final plots = Map<String, Map>.from(snapshot.data!.snapshot.value as Map);


                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(

                                  children: plots.values.map((plot)
                                  {

                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.015, // 4% of screen width
                                        //left: MediaQuery.of(context).size.width * 0.0001,
                                      ),
                                      child: Card(
                                        child: Container(
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.31,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.72,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.1),
                                                spreadRadius: 0,
                                                blurRadius: 0,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(10),
                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(10),
                                                      topRight: Radius.circular(10),
                                                    ),

                                                    child: Image.network(

                                                      plot['imageUrl'],
                                                      width: double.infinity,
                                                      //To fill the entire width of the container,
                                                      fit: BoxFit.cover,
                                                      alignment: Alignment.center,
                                                    )
                                                ),),

                                              Container(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(10),
                                                      bottomRight: Radius.circular(10),
                                                    ),

                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    margin: EdgeInsets.only(right: 20),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Expanded(

                                                            child: FittedBox(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [

                                                                  Padding(
                                                                      padding: EdgeInsets.only(
                                                                          left: 10, top: 5),
                                                                      child: Container(
                                                                          width: MediaQuery
                                                                              .of(context)
                                                                              .size
                                                                              .width * 0.14,
                                                                          height: MediaQuery
                                                                              .of(context)
                                                                              .size
                                                                              .height * 0.019,
                                                                          decoration: BoxDecoration(
                                                                            color: Colors.yellow,
                                                                          ),
                                                                          child: Center(
                                                                            child: Text(
                                                                                plot['name']
                                                                            ),
                                                                          )

                                                                      )),
                                                                  Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                        left: MediaQuery
                                                                            .of(context)
                                                                            .size
                                                                            .width * 0.025,
                                                                        top: MediaQuery
                                                                            .of(context)
                                                                            .size
                                                                            .height * 0.003),
                                                                    child: SizedBox(
                                                                        width: MediaQuery
                                                                            .of(context)
                                                                            .size
                                                                            .width * 0.4,
                                                                        child: Text(

                                                                          plot['desc'],

                                                                          maxLines: 1,
                                                                          style: TextStyle(
                                                                            fontSize: 18,
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontFamily: 'Bahnschrift',
                                                                            letterSpacing: 2.2,
                                                                          ),
                                                                        )

                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                        left: MediaQuery
                                                                            .of(context)
                                                                            .size
                                                                            .width *
                                                                            0.025),
                                                                    child: SizedBox(
                                                                        width: MediaQuery
                                                                            .of(context)
                                                                            .size
                                                                            .width * 0.4,
                                                                        child: Text(
                                                                          plot['type'],
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          maxLines: 1,
                                                                          style: TextStyle(
                                                                            fontSize: 16,
                                                                            fontFamily: 'PoppinsR',
                                                                            letterSpacing: 1.2,
                                                                            height: 1.2,
                                                                          ),
                                                                        )

                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets
                                                                        .only(left: 10),
                                                                    child: Column(
                                                                      children: [
                                                                        SizedBox(
                                                                            width: MediaQuery
                                                                                .of(context)
                                                                                .size
                                                                                .width * 0.4,
                                                                            // Set the desired maximum width for the text container
                                                                            child: Text(
                                                                              plot['price'].toString(),
                                                                              overflow: TextOverflow
                                                                                  .ellipsis,
                                                                              maxLines: 1,
                                                                              style: TextStyle(

                                                                                fontSize: 16,
                                                                                letterSpacing: 2,
                                                                                fontWeight: FontWeight
                                                                                    .bold,
                                                                                fontFamily: 'PoppinsR',
                                                                              ),
                                                                            )

                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 8,
                                                          right: 8, child: Align(
                                                            alignment: Alignment.centerRight,
                                                            child: Container(
                                                              padding: EdgeInsets.only(top: 40),
                                                              child: DiagonalButton(
                                                                width: 50,
                                                                height: 40,
                                                                upperColor: Color(hexColor('#D4CB16')),
                                                                lowerColor: Color(hexColor('#F9EE07')),
                                                                buttonText: 'Buy',
                                                                textStyle: TextStyle(color: Colors.black),
                                                                onPressed: () {
                                                                 if(user != null) {
                                                                   Navigator
                                                                       .push(
                                                                       context,
                                                                       MaterialPageRoute(
                                                                           builder:
                                                                               (
                                                                               context) =>
                                                                               Detail_Page(
                                                                                   plotNumberToFetch: plot['plotNumber'])
                                                                       )
                                                                   );
                                                                   // add your button press logic here
                                                                 }else{
                                                                   Navigator.pushReplacement(context,
                                                                     MaterialPageRoute(
                                                                         builder: (
                                                                             context) =>
                                                                             LogIn()),
                                                                   );
                                                                 }
                                  },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),),
                                    );
                                  }).toList(),
                                ),
                              );
                            }else if(snapshot.hasError){
                              return Center(child: Text('Error: ${snapshot.error}'));
                            }else{
                              return Center(child: CircularProgressIndicator());
                            }
                          }
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        // top: MediaQuery.of(context).size.height * 0.85,
                        left: MediaQuery.of(context).size.width * 0.77,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                'View More ',
                                style: TextStyle(
                                  color: Color(hexColor('#F9A602')),
                                  fontFamily: 'PoppinsR',
                                ),
                              ),
                              SvgPicture.asset('Icon/arrow.svg'), // Adjust the path to the correct SVG asset
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        // top: MediaQuery.of(context).size.height * 0.85,
                        left: MediaQuery.of(context).size.width * 0.77,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                'View More ',
                                style: TextStyle(
                                  color: Color(hexColor('#F9A602')),
                                  fontFamily: 'PoppinsR',
                                ),
                              ),
                              SvgPicture.asset('Icon/arrow.svg'), // Adjust the path to the correct SVG asset
                            ],),),),),]),)],),],),),);}}
int hexColor(String c){
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}


class DiagonalButton extends StatelessWidget {
  final double width;
  final double height;
  final Color upperColor;
  final Color lowerColor;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  DiagonalButton({
    required this.width,
    required this.height,
    required this.upperColor,
    required this.lowerColor,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(hexColor('#FFF100')).withOpacity(0.5),
              blurRadius: 0,
              offset: Offset(3.0, 3.0),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Container(),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomPaint(
                  painter: DiagonalButtonPainter(
                    upperColor: upperColor,
                    lowerColor: lowerColor,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        buttonText,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiagonalButtonPainter extends CustomPainter {
  Color upperColor;
  Color lowerColor;

  DiagonalButtonPainter({required this.upperColor, required this.lowerColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint upperPaint = Paint()..color = upperColor;
    Paint lowerPaint = Paint()..color = lowerColor;

    // Drawing the upper triangle
    Path upperPath = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(upperPath, upperPaint);

    // Drawing the lower triangle
    Path lowerPath = Path()
      ..moveTo(size.width, 0)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(lowerPath, lowerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}






class OutlinedTextStroke {
  final Color? color;
  final double? width;

  OutlinedTextStroke({this.color, this.width});
}

class OutlinedText extends StatelessWidget {
  final Text? text;
  final List<OutlinedTextStroke>? strokes;

  const OutlinedText({Key? key, this.text, this.strokes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    final list = strokes ?? [];
    double widthSum = 0;
    for (var i = 0; i < list.length; i++) {
      widthSum += list[i].width ?? 0;
      children.add(Text(text?.data ?? '',
          textAlign: text?.textAlign,
          style: (text?.style ?? TextStyle()).copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = widthSum
                ..color = list[i].color ?? Colors.transparent)));
    }

    return Stack(
      children: [...children.reversed, text ?? SizedBox.shrink()],
    );
  }
}
