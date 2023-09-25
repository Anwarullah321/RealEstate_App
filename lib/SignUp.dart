import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestateapp/LogIn.dart';
import 'package:realestateapp/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';





class SignUp extends StatefulWidget {


  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();


  final TextEditingController _passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(

        resizeToAvoidBottomInset: false,
        body: SafeArea(

            child:  Stack(
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
                      top: MediaQuery.of(context).size.height*0.085,
                      left: MediaQuery.of(context).size.width*0.05,

                    ),
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(

                              children: [

                                Container(
                                  width: MediaQuery.of(context).size.width*0.9,

                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _firstnameController,
                                    decoration: const InputDecoration(
                                      labelText: 'Firstname',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter firstname';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.9,

                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _lastnameController,
                                    decoration: const InputDecoration(
                                      labelText: 'Lastname',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter lastname';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.9,
                                  child:TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _emailController,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      labelText: 'Email',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.9,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Password',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),









                              ],
                            ),

                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),

                        child: SvgPicture.asset('Icons/Signup.svg',
                            width: MediaQuery.of(context).size.width * 0.46,
                            height: MediaQuery.of(context).size.height * 0.46),
                      ),
                    ),),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(

                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5),
                        child:ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),


                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _auth.createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ).then((userCredential) {
                                var user = userCredential.user;
                                String firstName = _firstnameController.text;
                                String lastName = _lastnameController.text;
                                String displayName = '$firstName $lastName';

                                user?.updateDisplayName(displayName).then((_) {
                                  // Display name updated successfully
                                  DatabaseReference userRef = FirebaseDatabase.instance.reference().child('users');

                                  userRef.child(user!.uid).set({
                                    'firstName': firstName,
                                    'lastName': lastName,
                                    'email': user.email,
                                    // Add any other user data you want to store
                                  }).then((_) {
                                    print('User data stored successfully');
                                    // Navigate to the login screen after successful registration
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => LogIn()),
                                    );
                                  }).catchError((error) {
                                    // Handle database storage error
                                    Utils().toastMessage('Error storing user data: $error');
                                  });
                                }).catchError((error) {
                                  // Handle update display name error
                                  Utils().toastMessage('Error updating display name: $error');
                                });
                              }).catchError((error) {
                                // Handle registration errors
                                Utils().toastMessage('Error registering user: $error');
                              });

                            }
                          },


                          child: Text(
                            'SIGN UP',
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
                          Text('Already an account?'),


                          Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LogIn()),
                                );
                              },
                              child: Text(
                                'LOGIN',
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