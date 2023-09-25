import 'package:flutter/material.dart';



class Pay_Page extends StatefulWidget {
  @override
  _Pay_PageState createState() => _Pay_PageState();
}

class _Pay_PageState extends State<Pay_Page> {
  String userInput = '';
  String selectedOption = 'Marla'; // Default selected option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input and Dropdown Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input field
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    userInput = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'User Input',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Dropdown button
            DropdownButton<String>(
              value: selectedOption,
              onChanged: (newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              items: <String>['Marla', 'Kanal']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            // Display user input and selected option horizontally
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$userInput '),
                  Text('$selectedOption'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
