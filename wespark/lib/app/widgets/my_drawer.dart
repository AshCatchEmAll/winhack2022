import 'package:flutter/material.dart';
import 'package:wespark/home/pages/home_page.dart';
import 'package:wespark/project_requests/pages/add_project_request.dart';
import 'package:wespark/project_requests/pages/project_request_page.dart';
import 'package:wespark/signup_requests/pages/signup_requests_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Drawer Header'),
      ),
      ListTile(
        title: const Text('Project Board'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return HomePage();
          }));
        },
      ),
      ListTile(
        title: const Text('Project Requests'),
        onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
            return ProjectRequestPage();
          }));
        },
      ),
       ListTile(
        title: const Text('Signup Requests'),
        onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context){
            return SignUpRequests();
          }));
        },
      ),
       ListTile(
        title: const Text('pr'),
        onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddProjectRequest();
          }));
        },
       )
    ],
  ),
);
  }
}