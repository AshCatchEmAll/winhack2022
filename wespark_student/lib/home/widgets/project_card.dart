import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:wespark_student/home/models/project_form_model.dart';
import 'package:wespark_student/home/pages/view_project_details.dart';
import 'package:wespark_student/home/widgets/tags_component.dart';


class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.projectModel,
     this.showDetailFooterButtons=true,
  }) : super(key: key);
  final ProjectFormModel projectModel;
final bool showDetailFooterButtons;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Column(
        children:  [
          ProjectCardTitle(
            weekday: projectModel.affiliation,
            date:projectModel.duration,
          ),
          ProjectCardContent(
            title: projectModel.email,
            tags: projectModel.tags,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: TextButton(onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProjectDetails(projectModel: projectModel,showButtons: showDetailFooterButtons,)));

                }, child: const Text("View More")),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProjectCardContent extends StatelessWidget {
  const ProjectCardContent({
    Key? key,
    required this.title,
    required this.tags,
  }) : super(key: key);
  final String title;
  final List tags;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueGrey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 8, top: 4),
              child: Text(
                title,
                textAlign: TextAlign.left,
                textScaleFactor: 1.2,
                style: const TextStyle(
                  fontFamily: "nunito",
                  color: Colors.black,
                ),
                softWrap: true,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 8, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("hey")],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 8, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...tags.map((e) {
                        return TagsComponent(
                          color: Color(0xff4e4e4e),
                          tagName: e.toString(),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCardTitle extends StatelessWidget {
  const ProjectCardTitle({
    Key? key,
    required this.weekday,
    required this.date,
  }) : super(key: key);
  final String weekday;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13), topRight: Radius.circular(13)),
        color: Color(0xff5C589C),
      ),
      child: Row(
        children: [
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 8, top: 8),
                child: Text(
                  weekday,
                  softWrap: true,
                  // textScaleFactor: 2,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      fontFamily: "nunito",
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1.5, bottom: 7.5, left: 18),
                child: Text(
                  date,
                  textScaleFactor: 1.2,
                  softWrap: true,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
