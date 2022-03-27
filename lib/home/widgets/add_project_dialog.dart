import 'package:flutter/material.dart';

class AddProjectDialog extends StatelessWidget {
  const AddProjectDialog({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Project"),
      content: Column(children: [
        TextField(
          
        ),
        TextField(),
        TextField(),
        TextField(),
      ]),
    );
  }
}