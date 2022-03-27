import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:wespark/app/widgets/progress_button.dart';
import 'package:wespark/home/models/project_model.dart';
import 'package:wespark/home/widgets/project_card.dart';
import 'package:wespark/project_requests/models/project_form_model.dart';
import 'package:wespark/signup_requests/components/student_card.dart';
import 'package:wespark/signup_requests/helpers/signup_request_firestore.dart';
import 'package:wespark/signup_requests/models/student_card_model.dart';

class SignUpRequests extends StatelessWidget {
  const SignUpRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Request"),
      ),
      body: FirestoreQueryBuilder<Map<String, dynamic>>(
        query: FirebaseFirestore.instance
            .collection('SignUpRequest')
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
              child: Text("No Signup requests pending"),
            );
          }

          return ListView.builder(
            itemCount: snapshot.docs.length,
            itemBuilder: (BuildContext context, int index) {
              var signupRequest = snapshot.docs[index].data();
              var id = snapshot.docs[index].id;
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FutureStudentCard(signupRequest: signupRequest),
                          Text("Wants to Signup For"),
                          FutureProjectCard(signupRequest: signupRequest),
                        ],
                      ),
                    ),
                    FooterButtons(
                      id: id,
                    
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FutureProjectCard extends StatelessWidget {
  const FutureProjectCard({
    Key? key,
    required this.signupRequest,
  }) : super(key: key);

  final Map<String, dynamic> signupRequest;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance
          .collection('Projects')
          .doc(signupRequest["project"])
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var project = snapshot.data!.data();
          print("GGWP ${project}");
          return ProjectCard(
            width: 300,
            projectModel: ProjectFormModel.fromFirebase(
                project as Map<String, dynamic>, signupRequest["project"]),
          );
        }
        return Container();
      },

      //  subtitle: Text(snapshot.docs[index].data()['email']),
    );
  }
}

class FutureStudentCard extends StatelessWidget {
  const FutureStudentCard({
    Key? key,
    required this.signupRequest,
  }) : super(key: key);

  final Map<String, dynamic> signupRequest;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance
          .collection('Students')
          .doc(signupRequest["student"])
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var student = snapshot.data!.data();
          print("GGWP ${student}");
          return StudentCard(
            studentCardModel: StudentCardModel.fromFirebase(
                student as Map<String, dynamic>, signupRequest["student"]),
          );
        }
        return Container();
      },
    );
  }
}

class FooterButtons extends StatelessWidget {
  FooterButtons({Key? key, required this.id,})
      : super(key: key);
  final String id;


  TextEditingController rejectText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProgressButton(
            child: const Text("Accept"),
            onPressed: () async {
              await acceptSignUpRequest(id);
            }),
        ProgressButton(
            child: const Text("Reject"),
            onPressed: () async {
              await showRejectRequestDialog(context,rejectText);
              await rejectSignUpRequest(id, rejectText);
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
                    "Reason for rejection which \nwill be sent to the client (Optional)",
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
