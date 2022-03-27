import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wespark/home/models/project_model.dart';

Future acceptSignUpRequest(String requestID) async {
  //Add project to students project taken

  //Remove project from board

  //Notifiy student on their email

  //Notifiy person who added project on their email

  //notify student on website

  //Add firebase event?
  CollectionReference requestCollection =
      FirebaseFirestore.instance.collection('SignUpRequest');
  DocumentSnapshot doc = await requestCollection.doc(requestID).get();

  //Get Firebase ProjectTaken Collection
  // CollectionReference projectTaken =  FirebaseFirestore.instance
  //     .collection('ProjectTaken');
  // projectTaken.doc(requestID).set(doc.data() as Map<String, dynamic>, SetOptions(merge: true));

  var requestData = doc.data() as Map<String, dynamic>;

  CollectionReference project =
      FirebaseFirestore.instance.collection('Projects');

  DocumentSnapshot projectDoc = await project.doc(requestData["project"]).get();

  var projectData = projectDoc.data() as Map<String, dynamic>;

  //Add project to students project taken

  CollectionReference projectTaken =
      FirebaseFirestore.instance.collection('ProjectTaken');

  projectData["student"] = requestData["student"];
  projectData["createdAt"] = Timestamp.now();
  projectTaken
      .doc(requestData["project"])
      .set(projectData, SetOptions(merge: true));
  CollectionReference studentCollection =
      FirebaseFirestore.instance.collection('ProjectTaken');
  await studentCollection.doc(requestData["student"]).set(
      {"volunteerCount": FieldValue.increment(1)}, SetOptions(merge: true));

  project.doc(requestData["project"]).delete();

  requestCollection.doc(requestID).delete();

  //Send emails to client

  //Notify on students web
}

Future rejectSignUpRequest(
    String requestID, TextEditingController rejectText) async {
  print(requestID);
  print(rejectText.text);
  CollectionReference requestCollection =
      FirebaseFirestore.instance.collection('SignUpRequests');
  DocumentSnapshot doc = await requestCollection.doc(requestID).get();
  var requestData = doc.data() as Map<String, dynamic>;
  //Send email to requestData["studentEmail"]
  await requestCollection.doc(requestID).delete();

  if (rejectText.text.isNotEmpty) {
    //send email with the text
  }
}
