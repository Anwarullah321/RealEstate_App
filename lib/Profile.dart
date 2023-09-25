import 'package:flutter/material.dart';

class Profile_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Details'),
      ),
      body: ListView(
        children: [
          // Property ID
          ListTile(
            title: Text('Property ID'),
            subtitle: Text('123456'),
          ),
          // Property Type
          ListTile(
            title: Text('Property Type'),
            subtitle: Text('Apartment'),
          ),
          // Property Size
          ListTile(
            title: Text('Property Size'),
            subtitle: Text('1200 sq. ft.'),
          ),
          // Property Orientation
          ListTile(
            title: Text('Property Orientation'),
            subtitle: Text('North'),
          ),
          // Nearby Places
          ExpansionTile(
            title: Text('Nearby Places'),
            children: [
              ListTile(
                title: Text('Nearby Parks'),
                subtitle: Text('Central Park, Bryant Park'),
              ),
              ListTile(
                title: Text('Schools in Vicinity'),
                subtitle: Text('Columbia University, NYU'),
              ),
              ListTile(
                title: Text('Closest Markets'),
                subtitle: Text('Whole Foods, Trader Joes'),
              ),
              ListTile(
                title: Text('Public Transport'),
                subtitle: Text('2 Subway Stations, 1 Bus Stop'),
              ),
              ListTile(
                title: Text('Other Nearby Places'),
                subtitle: Text('Museum of Modern Art, The Metropolitan Museum of Art'),
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
                subtitle: Text('Gym, Pool, Playground'),
              ),
              ListTile(
                title: Text('Property Highlights'),
                subtitle: Text('New Construction, High Ceilings, Private Terrace'),
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
                subtitle: Text('The Park Avenue Project'),
              ),
              ListTile(
                title: Text('Location'),
                subtitle: Text('5th Avenue, New York, NY 10019'),
              ),
              ListTile(
                title: Text('Builder Information'),
                subtitle: Text('ABC Construction'),
              ),
              ListTile(
                title: Text('Property Types'),
                subtitle: Text('Apartments, Townhouses, Condos'),
              ),
              ListTile(
                title: Text('Project Rules'),
                subtitle: Text('24-Hour Security, Pet Friendly'),
              ),
              ListTile(
                title: Text('Construction Update'),
                subtitle: Text('On Schedule'),
              ),
              ListTile(
                title: Text('Property Location'),
                subtitle: Text('Map'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
