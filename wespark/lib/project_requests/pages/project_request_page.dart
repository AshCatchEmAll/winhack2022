import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:wespark/app/widgets/progress_button.dart';
import 'package:wespark/home/models/project_model.dart';
import 'package:wespark/home/widgets/project_card.dart';
import 'package:wespark/project_requests/helpers/project_request_firebase.dart';
import 'package:wespark/project_requests/models/project_form_model.dart';
import 'package:wespark/signup_requests/helpers/signup_request_firestore.dart';

class ProjectRequestPage extends StatelessWidget {
  const ProjectRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project Request"),
      ),
      body: FirestoreQueryBuilder<Map<String, dynamic>>(
        query: FirebaseFirestore.instance
            .collection('ProjectRequests')
            .orderBy('createdAt', descending: true),
        builder: (context, snapshot, _) {
          if (snapshot.isFetching) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          }
          if (snapshot.docs.isEmpty) {
            return Center(
              child: Text("No product requests pending"),
            );
          }

          return ListView.builder(
            itemCount: snapshot.docs.length,
            itemBuilder: (BuildContext context, int index) {
             
              final id = snapshot.docs[index].id;
               ProjectFormModel projectRequest =  ProjectFormModel.fromFirebase(snapshot.docs[index].data(), id) ;
              return Column(
                children: [
                  ProjectCard(
                    projectModel: projectRequest,
                  ),
                  FooterButtons(id: id, clientEmail: projectRequest.email)
                ],
              );
            },
          );
        },
      ),
    );
  }
}
class FooterButtons extends StatelessWidget {
  FooterButtons({Key? key, required this.id, required this.clientEmail})
      : super(key: key);
  final String id;
  final String clientEmail;

  TextEditingController rejectText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProgressButton(
            child: const Text("Accept"),
            onPressed: () async {
              await acceptProjectRequest(id);
            }),
        ProgressButton(
            child: const Text("Reject"),
            onPressed: () async {
              await rejectProjectRequest(id, rejectText);
            })
      ],
    );
  }

  showRejectRequestDialog(
      BuildContext context, TextEditingController controller) async {
    await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Reject Request"),
            content: TextField(
              controller: controller,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText:
                    "Reason for rejection which will be sent to the client (Optional)",
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Skip")),
              TextButton(
                  child: Text("Done"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
}
