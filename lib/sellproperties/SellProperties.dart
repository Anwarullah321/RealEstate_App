import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';


class SellProperties extends StatefulWidget {
  @override
  _SellPropertiesState createState() => _SellPropertiesState();
}

class _SellPropertiesState extends State<SellProperties> {
  List<Plot> plots = [];


  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController plotNumberController = TextEditingController();
  //TextEditingController plotAreaController = TextEditingController();
  TextEditingController plotDimensionsController = TextEditingController();
  //TextEditingController plotBoundariesController = TextEditingController();
  TextEditingController plotDirectionController = TextEditingController();

  File? _image;
  final picker = ImagePicker();
  String name = 'Reseller';
  String desc = 'Marla';
  String type = 'Residential';
  double price = 0.0;
  String imageUrl = '';



  Future _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('plots');
  void _addPlot() async {

    name = name;
    desc = descController.text;
    type = type;

    String plotNumber = plotNumberController.text;
   // double plotArea = double.tryParse(plotAreaController.text) ?? 0.0;
    String plotDimensions = plotDimensionsController.text;
   // String plotBoundaries = plotBoundariesController.text;
    String plotDirection = plotDirectionController.text;

    double price = double.tryParse(priceController.text) ?? 0.0;
    if (name.isNotEmpty && desc.isNotEmpty && type.isNotEmpty && price != 0 && _image != null &&
        plotNumber.isNotEmpty &&
      //  plotArea != 0 &&
        plotDimensions.isNotEmpty &&

        plotDirection.isNotEmpty
    ) {
      try {
        DataSnapshot dataSnapshot = (await databaseReference.orderByChild('plotNumber').equalTo(plotNumber).once()).snapshot;

        if (dataSnapshot.value != null) {
          // Plot number already exists
          print('Plot number already exists please choose a different plot number');
          return;
        }
        // Uploading image to Firebase Storage
        Reference storageReference = FirebaseStorage.instance.ref().child('plot_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
        UploadTask uploadTask = storageReference.putFile(_image!);
        TaskSnapshot taskSnapshot = await uploadTask;
        imageUrl = await taskSnapshot.ref.getDownloadURL();

        // Creating a data map for the plot
        Map<String, dynamic> plotData = {

          'name': name,
          'desc': desc,
          'type': type,

          'price': price,
          'imageUrl': imageUrl,
          'plotNumber': plotNumber, // Include additional plot details
         // 'plotArea': plotArea,
          'plotDimensions': plotDimensions,
        //  'plotBoundaries': plotBoundaries,
          'plotDirection': plotDirection,
        };

        // Adding the plot data to Firebase Realtime Database


        //await databaseReference.push().set(plotData);
        //for child creation plotNumber
        await databaseReference.child(plotNumber).set(plotData);

        // Clearing the form and image after upload

      } catch (e) {
        print('Error uploading data: $e');
        // Show a snackbar or a dialog to inform the user about the error.
      }
    } else {
      print('Please fill all fields and select an image.');
    }
  }


  @override
  Widget build(BuildContext context) {
    Color appBarColor = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      appBar: customAppBar(context, appBarColor),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                     // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  initialValue: name,
                  enabled: false,  // disable editing
                ),

                TextFormField(
                  controller: plotNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Plot Number'),
                ),

                TextFormField(
                  controller: descController,
                  decoration: InputDecoration(
                    labelText: 'Area',
                  ),



                ),
                    SizedBox(width: 10),

                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'type'),
                  value: type,
                  onChanged: (String? newValue) {
                    setState(() {
                      type = newValue!;
                    });
                  },
                  items: ['Residential', 'Commercial']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),


               /* TextFormField(
                  controller: plotAreaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Plot Area'),
                ),*/
                TextFormField(
                  controller: plotDimensionsController,
                  decoration: InputDecoration(labelText: 'Plot Dimensions'),
                ),

                TextFormField(
                  controller: plotDirectionController,
                  decoration: InputDecoration(labelText: 'Plot Direction/Facing'),
                ),
                TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Price'),
                ),
                ElevatedButton(
                  onPressed: _getImage,
                  child: Text('Select Photo'),
                ),
                _image != null
                    ? Image.file(
                  _image!,
                  height: 100,
                  width: 100,
                )
                    : Container(),
                ElevatedButton(
                  onPressed: _addPlot,
                  child: Text('Add Plot'),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: plots.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: plots[index].imageUrl.isNotEmpty
                            ? Image.network(
                          plots[index].imageUrl,
                          height: 50,
                          width: 50,
                        )
                            : Container(),
                        title: Text('name: ${plots[index].name}'),
                        subtitle: Text(
                            'desc: ${plots[index].desc}\ntype: ${plots[index].type}\nPrice: ${plots[index].price.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Plot {

  final String name;
  final String desc;
  final String type;
  final double price;
  final String imageUrl;
  final String plotNumber;
  //final double plotArea;
  final String plotDimensions;
  //final String plotBoundaries;
  final String plotDirection;


  Plot({ required this.name, required this.desc, required this.type,required this.price, required this.imageUrl,
    required this.plotNumber, required this.plotDimensions,
    required this.plotDirection
  });
}


AppBar customAppBar(BuildContext context, Color appBarColor) {
  return AppBar(
    foregroundColor: Colors.black,
    backgroundColor: appBarColor,
    elevation: 0,
    title: Padding(
      padding: const EdgeInsets.only(left: 20, top: 5),
      child: Text(
        'User Panel',
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