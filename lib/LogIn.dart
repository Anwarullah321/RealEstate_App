import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestateapp/SignUp.dart';
import 'package:realestateapp/Widgets/Item_widget.dart';
import 'package:realestateapp/main.dart';
import 'package:realestateapp/models/catalog.dart';
import 'package:realestateapp/utils/utils.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance ;

  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
  }

  void login(){
    setState((){
      loading = true;
    });
    _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text.toString()).then((value){
      Utils().toastMessage(value.user!.email.toString());
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MyApp()),
      );
      setState((){
        loading = false;

      });

    }).onError((error, stackTrace){

      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;

      });
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // You can add more validation logic here if needed
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    // You can add more validation logic here if needed
    return null;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              right: -35,
              child: Container(



                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(hexColor('#F0B90B')),

                ),
              ),
            ),
            Positioned(
              top: 35,
              right: 45,
              child: Container(



                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(hexColor('#F0B90B')),

                ),
              ),
            ),
            Positioned(
              top: 45,
              right: 95,
              child: Container(



                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(hexColor('#F0B90B')),

                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.15,
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: _validateEmail,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        validator: _validatePassword,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),

                    child: SvgPicture.asset('Icons/Signup.svg'),
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1),
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed:   (){if(_formKey.currentState!.validate()){
              login();
                    }
              },
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ... your existing code ...
            Expanded(
              child: Container(
                padding: EdgeInsets.only(

                  top: MediaQuery.of(context).size.height*0.8,
                  left: MediaQuery.of(context).size.width*0.35,
                ),

                child: SvgPicture.asset('Icons/facebookicon.svg'),

              ),),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(

                  top: MediaQuery.of(context).size.height*0.8,
                  left: MediaQuery.of(context).size.width*0.46,
                ),

                child: SvgPicture.asset('Icons/Googleicon.svg'),

              ),),

            Expanded(
              child: Container(
                padding: EdgeInsets.only(

                  top: MediaQuery.of(context).size.height*0.87,
                  left: MediaQuery.of(context).size.width*0.35,
                ),

                child: Row(
                  children: [
                    Text('Need an account?'),


                    Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp())
                          );
                        },
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),

                    )
                  ],
                ),

              ),),



          ]

        )

      ));
  }
}
int hexColor(String c){
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}

