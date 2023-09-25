import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestateapp/Filter.dart';

class Reseller_Listings extends StatefulWidget {
  const Reseller_Listings({Key? key, }) : super(key: key);

  @override
  State<Reseller_Listings> createState() => _Reseller_ListingsState();
}

class _Reseller_ListingsState extends State<Reseller_Listings> {
  bool isFilesSelected = true;
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('plots');

  void selectFiles() {
    setState(() {
      isFilesSelected = true;
    });
  }

  void selectPlots() {
    setState(() {
      isFilesSelected = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    Color appBarColor = Theme.of(context).scaffoldBackgroundColor;
    return MaterialApp(
      home: Scaffold(
        appBar: customAppBar(context, appBarColor),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: selectFiles,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    'Files',
                                    style: TextStyle(
                                      fontSize: isFilesSelected ? 20 : 17,
                                      fontWeight: isFilesSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 3,
                                  color: isFilesSelected ? Colors.yellow : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 70), // Add space between "Files" and "Plots"
                          GestureDetector(
                            onTap: selectPlots,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    'Plots',
                                    style: TextStyle(
                                      fontSize: !isFilesSelected ? 20 : 17,
                                      fontWeight: !isFilesSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 3,
                                  color: !isFilesSelected ? Colors.yellow : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),




                  SizedBox(height: 30),

                  Expanded(
                    child: SingleChildScrollView(
                      child: StreamBuilder<DatabaseEvent>(
                          stream: ref.orderByChild('name').equalTo('Reseller').onValue,
                          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
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

                              return Column(
                                 children: [
                                   Positioned(
                                     top: 0,
                                     right: 16,
                                     child: FloatingActionButton(
                                       onPressed: () {
                                         // Navigate to the filtering page
                                         Navigator.push(
                                           context,
                                           MaterialPageRoute(builder: (context) => Filter()),
                                         );
                                       },
                                       child: Icon(Icons.filter_list),
                                     ),
                                   ),


                                   Column(
                                     children: plots.values.map((plot){
                                      return Card(
                                               shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(10),
                                               ),
                                               child: Stack(
                                                 children: [
                                                   Align(
                                                     alignment: Alignment.topCenter,
                                                     child: Row(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         ClipRRect(
                                                           borderRadius: BorderRadius.circular(10),
                                                           child: Container(
                                                             width: 160,
                                                             height: 120, // Set the desired height for the image
                                                             child: Image.network(
                                                               plot['imageUrl'],
                                                               width: double.infinity,
                                                               fit: BoxFit.cover, // Use BoxFit.cover to maintain aspect ratio
                                                               alignment: Alignment.center,
                                                             ),
                                                           ),
                                                         ),
                                                         Column(
                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                           children: [
                                                             Padding(
                                                               padding: EdgeInsets.only(left: 8, top: 4),
                                                               child: Container(
                                                                 decoration: BoxDecoration(
                                                                   color: Colors.yellow,
                                                                   borderRadius: BorderRadius.circular(5),
                                                                 ),
                                                                 padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                                                                 child: Text(
                                                                   plot['name'],
                                                                   style: TextStyle(fontSize: 12),
                                                                 ),
                                                               ),
                                                             ),
                                                             Padding(
                                                               padding: EdgeInsets.only(left: 8,top: 3),
                                                               child: Text(
                                                                 plot['desc'],
                                                                 style: TextStyle(
                                                                   fontFamily: 'Bahnschrift',
                                                                   fontSize: 17,
                                                                   fontWeight: FontWeight.bold,
                                                                   letterSpacing: 2.2,
                                                                 ),
                                                               ),
                                                             ),
                                                             SizedBox(
                                                               width: MediaQuery.of(context).size.width * 0.36,
                                                               child: Padding(
                                                                 padding: EdgeInsets.only(left: 8),
                                                                 child: Text(
                                                                   plot['type'],
                                                                   style: TextStyle(
                                                                     fontFamily: 'Bahnschrift',
                                                                     fontSize: 17,
                                                                     letterSpacing: 1,
                                                                   ),
                                                                 ),
                                                               ),
                                                             ),
                                                             Padding(
                                                               padding: EdgeInsets.only(left: 8),
                                                               child: Text(
                                                                 plot['price'].toString(),
                                                                 style: TextStyle(
                                                                   fontFamily: 'Bahnschrift',
                                                                   fontSize: 17,
                                                                   letterSpacing: 1.2,
                                                                 ),
                                                               ),
                                                             ),
                                                           ],
                                                         ),
                                                       ],
                                                     ),
                                                   ),
                                                   Positioned(
                                                     bottom: 8,
                                                     right: 8,
                                                     child: Align(
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
                                                             // add your button press logic here
                                                           },
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             );



                                    }).toList()
                                   )
                                 ]);


                            }else if(snapshot.hasError){
                              return Center(child: Text('Error:  ${snapshot.error}'));
                            }else{
                              return Center(child: CircularProgressIndicator());
                            }
                          }   ),
                    ),
                  ),








                ],
              ),
            ),
          ],
        ),
        // ...
      ),
    );
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
        'Reseller Listings',
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
    // Other AppBar properties and widgets
    // ...
  );
}

int hexColor(String c){
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}
class DiagonalButtonPainter extends CustomPainter {
  Color upperColor;
  Color lowerColor;

  DiagonalButtonPainter({required this.upperColor, required this.lowerColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint upperPaint = Paint()..color = upperColor;
    Paint lowerPaint = Paint()..color = lowerColor;
    Path path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width, size.height * 0)
      ..lineTo(0, size.height * 1)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path, upperPaint);
    path = Path()
      ..moveTo(size.width, size.height)
      ..lineTo(0, size.height * 1)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height*0)
      ..close();
    canvas.drawPath(path, lowerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DiagonalButton extends StatelessWidget {
  final double width;
  final double height;
  final Color upperColor;
  final Color lowerColor;
  final String buttonText;
  final TextStyle textStyle;
  final Function() onPressed;

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

    return Container(

      width: 50,
      height: 30,

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(hexColor('#FFF100')).withOpacity(0.5),
            blurRadius: 0,
            offset: Offset(3.0,3.0),
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
              width: 50,
              height: 30,
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
                  child:Padding(
                    padding: EdgeInsets.only(top: 5),
                    child:  Text(
                      buttonText,
                      style: TextStyle(fontSize: 22),

                    ),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
