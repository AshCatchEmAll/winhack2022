import 'package:flutter/material.dart';
import 'package:wespark/project_requests/models/project_form_model.dart';


class ViewProjectDetails extends StatefulWidget {
  const ViewProjectDetails({Key? key, required this.projectModel,this.showButtons=false})
      : super(key: key);
  final ProjectFormModel projectModel;
  final bool showButtons;
  @override
  State<ViewProjectDetails> createState() => _ViewProjectDetailsState();
}

class _ViewProjectDetailsState extends State<ViewProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, bottom: 16, top: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(widget.projectModel.affiliation,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, bottom: 8, top: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(widget.projectModel.email,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, bottom: 16, top: 8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(widget.projectModel.name,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, bottom: 16, top: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(widget.projectModel.description,
                      softWrap: true,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16.0,
                      )),
                ),
              ),
              // widget.descriptionPhotos.isNotEmpty
              //     ? Align(
              //         alignment: Alignment.centerLeft,
              //         child: Padding(
              //           padding: const EdgeInsets.only(
              //               left: 8.0, right: 8.0, bottom: 16, top: 16),
              //           child: SizedBox(
              //             child: TextButton(
              //                 style: TextButton.styleFrom(
              //                   side: const BorderSide(color: appbarColor),
              //                 ),
              //                 onPressed: () {
              //                   showDialog(
              //                       context: context,
              //                       builder: (context) {
              //                         return ShowNotesPhotosDialog(
              //                             photos: widget.descriptionPhotos);
              //                       });
              //                 },
              //                 child: const Text(
              //                   "Photos",
              //                   style: TextStyle(color: appbarColor),
              //                 )),
              //           ),
              //         ),
              //       )
              //     : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      
    );
  }
}
