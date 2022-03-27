import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:wespark/home/models/project_model.dart';
import 'package:wespark/home/widgets/project_card.dart';
import 'package:wespark/project_requests/models/project_form_model.dart';

class ProjectBoard extends StatefulWidget {
  const ProjectBoard({Key? key}) : super(key: key);

  @override
  State<ProjectBoard> createState() => _ProjectBoardState();
}

class _ProjectBoardState extends State<ProjectBoard> {
  @override
  Widget build(BuildContext context) {
    return FirestoreQueryBuilder<Map<String, dynamic>>(
  query: FirebaseFirestore.instance.collection('Projects'),
  builder: (context, snapshot, _) {
    // ...

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 3/2,crossAxisSpacing: 3),
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        // if we reached the end of the currently obtained items, we try to
        // obtain more items
        if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
          // Tell FirestoreQueryBuilder to try to obtain more items.
          // It is safe to call this function from within the build method.
          snapshot.fetchMore();
        }

        final project = snapshot.docs[index].data();
        final id = snapshot.docs[index].id;
        return ProjectCard(
          projectModel: ProjectFormModel.fromFirebase(project,id),
          
        );
      },
    );
  },
);
  }
}
