
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wespark_form/models/project_form_model.dart';

Future addProjectRequest(ProjectFormModel model) async {
  print("SDSdf : ${model.toJson()}");
  Map <String,dynamic> data = model.toJson();
  data["createdAt"] = Timestamp.now();
  CollectionReference projectRequests =
      FirebaseFirestore.instance.collection('ProjectRequests');
  await projectRequests.add(data);
}
