import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future sendSignUpRequest(String projectID) async {
  var check = await FirebaseFirestore.instance
      .collection("SignUpRequest")
      .where("student", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where("project", isEqualTo: projectID)
      .limit(1)
      .get();
  if (check.docs.length == 0) {
    await FirebaseFirestore.instance.collection("SignUpRequest").add({
      "student": FirebaseAuth.instance.currentUser!.uid,
      "project": projectID,
      "createdAt": DateTime.now()
    });
    return false;
  } else {
    return true;
  }
}
