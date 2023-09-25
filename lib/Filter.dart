import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  String dropdownValuePrice = 'Any';
  String dropdownValuePrice1 = 'Any';
  String dropdownValueArea = 'Any';
  String dropdownValueArea1 = 'Any';
  String? errorMessage;
  String? errorMessage1;
  String selectedCategory = 'Any';
  String selectedStatus = 'Any';
  String selectedPlan = 'Any';
  Widget build(BuildContext context) {
    Color appBarColor = Theme.of(context).scaffoldBackgroundColor;
    return MaterialApp(
      home: Scaffold(
        appBar: customAppBar(context, appBarColor),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  padding: EdgeInsets.only(left: 20, top: 16,bottom: 10),
                  child: Text(
                    'Type',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width*0.5,

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 90,
                            height: 40,

                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(10),
                            ),


                            child: Center(
                              child: Text(
                                'Files',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,

                                ),
                              ),
                            ),),
                        ),

                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 90,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Plots',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 20, top: 16,bottom: 10),
                  child: Text(
                    'Category',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width*0.9,

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: selectedCategory == 'Any' ? Colors.yellow : Colors.white,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedCategory = 'Any';
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.046,
                              child: Center(
                                child: Text(
                                  'Any',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: selectedCategory == 'Any' ? Colors.black : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: selectedCategory == 'Residential' ? Colors.yellow : Colors.white,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedCategory = 'Residential';
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.046,
                              child: Center(
                                child: Text(
                                  'Residential',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: selectedCategory == 'Residential' ? Colors.black : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: selectedCategory == 'Commercial' ? Colors.yellow : Colors.white,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedCategory = 'Commercial';
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.046,
                              child: Center(
                                child: Text(
                                  'Commercial',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: selectedCategory == 'Commercial' ? Colors.black : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 20, top: 16,bottom: 10),
                  child: Text(
                    'Status',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width*0.9,

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: selectedStatus == 'Any' ? Colors.yellow : Colors.white,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedStatus = 'Any';
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.046,
                              child: Center(
                                child: Text(
                                  'Any',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: selectedStatus == 'Any' ? Colors.black : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: selectedStatus == 'Regular' ? Colors.yellow : Colors.white,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedStatus = 'Regular';
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.046,
                              child: Center(
                                child: Text(
                                  'Regular',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: selectedStatus == 'Regular' ? Colors.black : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: selectedStatus == 'Reseller' ? Colors.yellow : Colors.white,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedStatus = 'Reseller';
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.046,
                              child: Center(
                                child: Text(
                                  'Reseller',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: selectedStatus == 'Reseller' ? Colors.black : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),


                Container(
                  padding: EdgeInsets.only(left: 20, top: 16,bottom: 10),
                  child: Text(
                    'Plan',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width*0.9,

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: selectedPlan == 'Any' ? Colors.yellow : Colors.white,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedPlan = 'Any';
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.046,
                              child: Center(
                                child: Text(
                                  'Any',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: selectedPlan == 'Any' ? Colors.black : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: selectedPlan == 'Installment' ? Colors.yellow : Colors.white,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedPlan = 'Installment';
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.046,
                              child: Center(
                                child: Text(
                                  'Installment',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: selectedPlan == 'Installment' ? Colors.black : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: selectedPlan == 'One-Time' ? Colors.yellow : Colors.white,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedPlan = 'One-Time';
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.046,
                              child: Center(
                                child: Text(
                                  'One-Time',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: selectedPlan == 'One-Time' ? Colors.black : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 20, top: 16, bottom: 10),
                        child: Text(
                          'Area',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 80, top: 20),
                        child: Text(
                          'Change area (Kanal)',
                          style: TextStyle(fontSize: 16.0,
                          color: Colors.black54,
                          ),

                        ),
                      ),
                    ),
                  ],
                ),


                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width*0.9,

                  child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [


                        Column(
                          children: [
                            Text('Minimum',
                            style: TextStyle(
                              color: Colors.black54,
                            ),),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.35,
                                height: MediaQuery.of(context).size.height*0.046,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: DropdownButton<String>(
                                    value: dropdownValueArea, // Define the currently selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValueArea = newValue!;
                                        errorMessage = null;

                                        if (dropdownValueArea != 'Any' && dropdownValueArea1 != 'Any') {
                                          // Check condition for minimum and maximum amounts
                                          if (int.tryParse(dropdownValueArea.replaceAll(',', ''))! > int.tryParse(dropdownValueArea1.replaceAll(',', ''))!) {

                                            errorMessage = 'Maximum amount cannot be less than minimum amount';
                                          }
                                        }
                                        // Update the selected value
                                      });
                                    },
                                    items: <String>[
                                      'Any',
                                      '500,000',
                                      '1,000,000',
                                      '1,500,000',
                                      '2,000,000'
                                      // Add more options as needed
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      );
                                    }).toList(),

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                         Text('To',
                         style: TextStyle(
                           fontSize: 18,
                         ),
                         ),
                        Column(
                          children: [
                            Text('Maximum',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.35,
                                height: MediaQuery.of(context).size.height*0.046,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: DropdownButton<String>(
                                    value: dropdownValueArea1, // Define the currently selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValueArea1 = newValue!;
                                        errorMessage = null;

                                        if (dropdownValueArea != 'Any' && dropdownValueArea1 != 'Any') {
                                          // Check condition for minimum and maximum amounts
                                          if (int.tryParse(dropdownValueArea.replaceAll(',', ''))! > int.tryParse(dropdownValueArea1.replaceAll(',', ''))!) {

                                            errorMessage = 'Maximum amount cannot be less than minimum amount';
                                          }
                                        }
                                        // Update the selected value
                                      });
                                    },
                                    items: <String>[
                                      'Any',
                                      '500,000',
                                      '1,000,000',
                                      '1,500,000',
                                      '2,000,000'
                                      // Add more options as needed
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      );
                                    }).toList(),

                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),

                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 10),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 16,bottom: 10),
                  child: Text(
                    'Price',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width*0.9,

                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Column(
                        children: [
                          Text('Minimum',
                            style: TextStyle(
                              color: Colors.black54,
                            ),),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.height * 0.046,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: DropdownButton<String>(
                                  value: dropdownValuePrice, // Define the currently selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValuePrice = newValue!;
                                      errorMessage1 = null;

                                      if (dropdownValuePrice != 'Any' && dropdownValuePrice1 != 'Any') {
                                        // Check condition for minimum and maximum amounts
                                        if (int.tryParse(dropdownValuePrice.replaceAll(',', ''))! > int.tryParse(dropdownValuePrice1.replaceAll(',', ''))!) {

                                          errorMessage1 = 'Maximum amount cannot be less than minimum amount';
                                        }
                                      }
                                      // Update the selected value
                                    });
                                  },
                                  items: <String>[
                                    'Any',
                                    '500,000',
                                    '1,000,000',
                                    '1,500,000',
                                    '2,000,000'
                                    // Add more options as needed
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),

                                ),

                              ),
                            ),
                          ),

                        ],
                      ),
                      Text('To',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Column(
                        children: [
                          Text('Maximum',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.35,
                              height: MediaQuery.of(context).size.height*0.046,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child:DropdownButton<String>(
                                  value: dropdownValuePrice1, // Define the currently selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValuePrice1 = newValue!;
                                      errorMessage1 = null;

                                      if (dropdownValuePrice != 'Any' && dropdownValuePrice1 != 'Any') {
                                        // Check condition for minimum and maximum amounts
                                        if (int.tryParse(dropdownValuePrice.replaceAll(',', ''))! > int.tryParse(dropdownValuePrice1.replaceAll(',', ''))!) {

                                          errorMessage1 = 'Maximum amount cannot be less than minimum amount';
                                        }
                                      }
                                      // Update the selected value
                                    });
                                  },
                                  items: <String>[
                                    'Any',
                                    '500,000',
                                    '1,000,000',
                                    '1,500,000',
                                    '2,000,000'
                                    // Add more options as needed
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),

                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
                if (errorMessage1 != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 10),
                    child: Text(
                      errorMessage1!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  SizedBox(height: 20),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.41,
                          vertical: MediaQuery.of(context).size.height*0.017),
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow, // Set button color to yellow
                          shadowColor: Colors.black, // Set drop shadow color to black
                          elevation: 2, // Set elevation/drop shadow intensity
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Set border radius of the button
                          ),
                        ),
                        child: Text(
                          'Find',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ),

          ],
        ),
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
        'Filters',
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
