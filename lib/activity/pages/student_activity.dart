import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:wespark_student/home/models/project_form_model.dart';
import 'package:wespark_student/home/models/project_model.dart';
import 'package:wespark_student/home/widgets/project_card.dart';

class StudentActivityPage extends StatelessWidget {
  const StudentActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Activity")),
      body: FirestoreListView<Map<String, dynamic>>(
        query: FirebaseFirestore.instance
            .collection('ProjectTaken')
            .orderBy('createdAt', descending: true),
        itemBuilder: (context, snapshot) {
          Map<String, dynamic> project = snapshot.data();
          var id = snapshot.id;
          return ProjectCard(
            projectModel: ProjectFormModel.fromFirebase(project, id),
        showDetailFooterButtons: false,
          );
         
        },
      ),
    );
  }
}
