import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:realestateapp/Payment/PaymentPage.dart';


class Detail_Page extends StatefulWidget {
  Detail_Page({Key? key, required this.plotNumberToFetch}) : super(key: key);
  final String plotNumberToFetch;

  @override
  State<Detail_Page> createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {
  final auth = FirebaseAuth.instance;

  final ref = FirebaseDatabase.instance.ref('plots');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail_page')),
        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<DatabaseEvent>(
          stream: ref.orderByChild('plotNumber').equalTo(widget.plotNumberToFetch).onValue,
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
        final plots = Map<String, Map>.from(
            snapshot.data!.snapshot.value as Map);


        return Stack(
          children: plots.values.map((plot) {
           return ListView(
             children: [
               // Property ID
               ListTile(
                 title: Text('Property ID'),
                 subtitle: Text(plot['plotNumber']),
               ),
               // Property Type
               ListTile(
                 title: Text('Property Type'),
                 subtitle: Text(plot['type']),
               ),
               // Property Size
               ListTile(
                 title: Text('Property Size'),
                 subtitle: Text(plot['desc']),
               ),
               // Property Orientation
               ListTile(
                 title: Text('Property Orientation'),
                 subtitle: Text(plot['plotDirection']),
               ),
               ListTile(
                 title: Text('Property Price'),
                 subtitle: Text(plot['price'].toString()),
               ),

               // Nearby Places
               ExpansionTile(
                 title: Text('Nearby Places'),
                 children: [
                   ListTile(
                     title: Text('Nearby Parks'),
                     subtitle: Text('-----'),
                   ),
                   ListTile(
                     title: Text('Schools in Vicinity'),
                     subtitle: Text('-----'),
                   ),
                   ListTile(
                     title: Text('Closest Markets'),
                     subtitle: Text('------'),
                   ),
                   ListTile(
                     title: Text('Public Transport'),
                     subtitle: Text('-----'),
                   ),
                   ListTile(
                     title: Text('Other Nearby Places'),
                     subtitle: Text('------'),
                   ),
                 ],
               ),
               // About the Property
               ExpansionTile(
                 title: Text('About the Property'),
                 children: [
                   ListTile(
                     title: Text('Property Layout Plan'),
                     subtitle: Text('Download PDF'),
                   ),
                   ListTile(
                     title: Text('Project Facilities Accessible'),
                     subtitle: Text('-----'),
                   ),
                   ListTile(
                     title: Text('Property Highlights'),
                     subtitle: Text('-----'),
                   ),
                   ListTile(
                     title: Text('Actual Property Photos'),
                     subtitle: Text('View Gallery'),
                   ),
                 ],
               ),
               // Project Information
               ExpansionTile(
                 title: Text('Project Information'),
                 children: [
                   ListTile(
                     title: Text('Project Name'),
                     subtitle: Text('-------'),
                   ),
                   ListTile(
                     title: Text('Location'),
                     subtitle: Text('------'),
                   ),
                   ListTile(
                     title: Text('Builder Information'),
                     subtitle: Text('-----'),
                   ),
                   ListTile(
                     title: Text('Property Types'),
                     subtitle: Text('------'),
                   ),
                   ListTile(
                     title: Text('Project Rules'),
                     subtitle: Text('-------'),
                   ),
                   ListTile(
                     title: Text('Construction Update'),
                     subtitle: Text('-----'),
                   ),
                   ListTile(
                     title: Text('Property Location'),
                     subtitle: Text('Map'),
                   ),

                 ],
               ),
               Container(
                 child: ElevatedButton(
                   onPressed: () {
                     Navigator.push(context,
                     MaterialPageRoute(builder: (context) => PaymentPage())
                     );
                   },
                   child: Text('Next'),
                 ),
               ),
             ],
           );


          }  ).toList()

        );


      }else if(snapshot.hasError){
      return Center(child: Text('Error: ${snapshot.error}'));
      }else{
      return Center(child: CircularProgressIndicator());
      }
    }
    )

    ));
  }
}
