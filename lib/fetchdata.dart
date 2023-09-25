import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome!'),
              StreamBuilder<List<dynamic>>(
                initialData: [],
                stream: FirebaseDatabase.instance
                    .reference()
                    .child('plots')
                    .orderByChild('name')
                    .onValue
                    .map((event) {
                  if (event.snapshot.exists) {
                    return event.snapshot.children.map((e) => e.value).toList();
                  } else {
                    return [];
                  }
                }),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<dynamic> plots = snapshot.data!;
                    return Text(plots.join('\n'));
                  } else {
                    return Text('Loading...');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}