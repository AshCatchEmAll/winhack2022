import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wespark/project_requests/models/project_form_model.dart';

Future acceptProjectRequest(String projectRequestID) async {
  CollectionReference projectRequests =
      FirebaseFirestore.instance.collection('ProjectRequests');
  DocumentSnapshot doc = await projectRequests.doc(projectRequestID).get();
  var projectRequestData = doc.data() as Map<String, dynamic>;

  CollectionReference project =
      FirebaseFirestore.instance.collection('Projects');

  await project
      .doc(projectRequestID)
      .set(projectRequestData, SetOptions(merge: true));
  await projectRequests.doc(projectRequestID).delete();

  //Send emails to client about acceptance

  //Notify on students web
}

Future rejectProjectRequest(
    String projectRequestID, TextEditingController rejectText) async {
  CollectionReference projectRequests =
      FirebaseFirestore.instance.collection('ProjectRequests');
  DocumentSnapshot doc = await projectRequests.doc(projectRequestID).get();
  var projectRequestData = doc.data() as Map<String, dynamic>;

  //Send email to projectRequestData["clientEmail"]
  await projectRequests.doc(projectRequestID).delete();
}

Future addProjectRequest(ProjectFormModel model) async {
  print("SDSdf : ${model.toJson()}");
  Map <String,dynamic> data = model.toJson();
  data["createdAt"] = Timestamp.now();
  CollectionReference projectRequests =
      FirebaseFirestore.instance.collection('ProjectRequests');
  await projectRequests.add(data);
}
