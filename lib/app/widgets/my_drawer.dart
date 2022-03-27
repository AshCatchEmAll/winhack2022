import 'package:flutter/material.dart';
import 'package:wespark_student/activity/pages/student_activity.dart';
import 'package:wespark_student/home/pages/home_page.dart';
import 'package:wespark_student/profile/pages/profile_page.dart';

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
        title: const Text('Activity'),
        onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context){
            return StudentActivityPage();
          }));
        },
      ),
      //  ListTile(
      //   title: const Text('Profile'),
      //   onTap: () {
      //      Navigator.push(context, MaterialPageRoute(builder: (context){
      //       return ProfilePage();
      //     }));
      //   },
      // ),
    ],
  ),
);
  }
}