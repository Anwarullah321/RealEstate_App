import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realestateapp/Diverse.dart';
import 'package:realestateapp/Files.dart';
import 'package:realestateapp/Pay.dart';
import 'package:realestateapp/Profile.dart';
import 'package:realestateapp/SignUp.dart';
import 'package:realestateapp/Widgets/Item_widget.dart';
import 'package:realestateapp/models/catalog.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Stripe.publishableKey = 'pk_test_51Nde4DDvEqfj5pPPdGIG0IDpSA4voc7mrfePJoP67dEQ0X0uuyYqJ6ik9H5vWbVSWbGKbm4kT85N89B2BaoEoZTX00Lyj32u7A';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {

        '/books': (context) => Books_Page(),
        '/files': (context) => Files_Page(),
        '/pay':  (context) => Pay_Page(),
        '/profile': (context) => Profile_Page()
      },
      home: Scaffold(
        body: HomeWrapper(),
      ),
    );
  }
}

class HomeWrapper extends StatefulWidget {
  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int selectedIndex = 0;
  bool showLabels = false;
  int myIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    PropertyWidget(),
    Books_Page(),
    Files_Page(),
    Pay_Page(),
    Profile_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myIndex,
        onTap: (index) {
          setState(() {
            myIndex = index;
            showLabels = true;
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                setState(() {
                  myIndex = 0;
                  showLabels = true;
                  selectedIndex = 0;
                });
              },
              child: SvgPicture.asset(
                'Icon/NHome.svg',
                color: myIndex == 0 ? Color(hexColor('#D4CB16')) : Color(hexColor('#C6C6C6')),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                setState(() {
                  myIndex = 1;
                  showLabels = true;
                  selectedIndex = 1;
                });
              },
              child: SvgPicture.asset(
                'Icon/Books.svg',
                color: myIndex == 1 ? Color(hexColor('#D4CB16')) : Color(hexColor('#C6C6C6')),
              ),
            ),
            label: 'Books',
          ),

          BottomNavigationBarItem(
            icon: InkWell(
              onTap: (){
                setState(() {
                  myIndex = 2;
                  showLabels = true;
                  selectedIndex = 2;
                });
              },
              child: SvgPicture.asset(
                'Icon/Files.svg',
                color: myIndex == 2 ? Color(hexColor('#D4CB16')): Color(hexColor('#C6C6C6')),
              ),

            ),
            label: 'My FIles'
          ),

          BottomNavigationBarItem(
              icon: InkWell(
                onTap: (){
                  setState(() {
                    myIndex = 3;
                    showLabels = true;
                    selectedIndex = 3;
                  });
                },
                child: SvgPicture.asset(
                  'Icon/Pay.svg',
                  color: myIndex == 3 ? Color(hexColor('#D4CB16')): Color(hexColor('#C6C6C6')),
                )
              ),
            label: 'Pay',
          ),

          BottomNavigationBarItem(
            icon: InkWell(
                onTap: (){
                  setState(() {
                    myIndex = 4;
                    showLabels = true;
                    selectedIndex = 4;
                  });
                },
                child: SvgPicture.asset(
                  'Icon/Profile.svg',
                  color: myIndex == 4 ? Color(hexColor('#D4CB16')): Color(hexColor('#C6C6C6')),
                )
            ),
            label: 'Profile',
          ),

        ],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}



int hexColor(String c) {
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}
