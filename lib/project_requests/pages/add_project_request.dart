import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:wespark/app/widgets/progress_button.dart';
import 'package:wespark/project_requests/helpers/project_request_firebase.dart';
import 'package:wespark/project_requests/models/project_form_model.dart';

class AddProjectRequest extends StatefulWidget {
  const AddProjectRequest({Key? key}) : super(key: key);

  @override
  State<AddProjectRequest> createState() => _AddProjectRequestState();
}

class _AddProjectRequestState extends State<AddProjectRequest> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text("1. First and Last name",style:TextStyle(fontSize: 25) ,),
                  FormBuilderTextField(
                    name: 'name',
                    decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromRGBO(33, 33, 33, 0.08),
                                  hintText: 'First name & Last name',
                                  filled: true,
                                  focusColor: Colors.white,
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                    onChanged: (value) {},
                    // valueTransformer: (text) => num.tryParse(text),

                    keyboardType: TextInputType.number,
                  ),
                   Text("2. Email",style:TextStyle(fontSize: 25) ,),
                  FormBuilderTextField(
                    name: 'email',
                    decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromRGBO(33, 33, 33, 0.08),
                                  hintText: 'Email',
                                  filled: true,
                                  focusColor: Colors.white,
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                    onChanged: (value) {},
                    // valueTransformer: (text) => num.tryParse(text),

                    keyboardType: TextInputType.number,
                  ),
                   Text("3. Primary Affiliation",style:TextStyle(fontSize: 25) ,),
                  FormBuilderRadioGroup(
                    name: "affiliation",
                    options: [
                      FormBuilderFieldOption(
                          value: 'Hôtel-Dieu Grace Healthcare', child: Text('Hôtel-Dieu Grace Healthcare')),
                      FormBuilderFieldOption(
                          value: 'St. Clair College', child: Text('St. Clair College')),
                      FormBuilderFieldOption(
                          value: 'University of Windsor', child: Text('University of Windsor')),
                      FormBuilderFieldOption(
                          value: 'Windsor Regional Hospital', child: Text('Windsor Regional Hospital')),
                      FormBuilderFieldOption(
                        value: 'otherAffiliation',
                        child: FormBuilderTextField(
                          name: 'otherAffiliation',
                          decoration: InputDecoration(
                            labelText: 'Other',
                          ),
                          onChanged: (value) {},
                          // valueTransformer: (text) => num.tryParse(text),

                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                   Text("4. Type of task",style:TextStyle(fontSize: 25) ,),
                  FormBuilderCheckboxGroup(name: "tags", options: const [
                    FormBuilderFieldOption(
                        value: 'Data Analytics/Entry/Collection',
                        child: Text('Data Analytics/Entry/Collection')),
                    FormBuilderFieldOption(
                        value: 'Grant Writing', child: Text('Grant Writing')),
                    FormBuilderFieldOption(
                        value: 'Graphic Design/Infographics', child: Text('Graphic Design/Infographics')),
                    FormBuilderFieldOption(
                        value: 'Literature Review', child: Text('Literature Review')),
                    FormBuilderFieldOption(
                        value: 'Photography', child: Text('Photography')),
                    FormBuilderFieldOption(
                        value: 'Plain Language/Science Communication',
                        child: Text('Plain Language/Science Communication')),
                    FormBuilderFieldOption(
                        value: 'Planning & Organizing Events', child: Text('Planning & Organizing Events')),
                  ]),
                   Text("5. Short description of the work",style:TextStyle(fontSize: 25) ,),
                  FormBuilderTextField(
                    name: 'description',
                    decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromRGBO(33, 33, 33, 0.08),
                                  hintText: 'Description',
                                  filled: true,
                                  focusColor: Colors.white,
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                    onChanged: (value) {},
                    // valueTransformer: (text) => num.tryParse(text),

                    keyboardType: TextInputType.number,
                  ),
                   Text("6. Duration",style:TextStyle(fontSize: 25) ,),
                 
                  FormBuilderRadioGroup(
                    name: "duration",
                    options: [
                      FormBuilderFieldOption(value: '1 week', child: Text('1 week')),
                      FormBuilderFieldOption(value: '1 month', child: Text('1 month')),
                      FormBuilderFieldOption(value: '3 months', child: Text('3 months')),
                      FormBuilderFieldOption(value: '6 months', child: Text('6 months')),
                      FormBuilderFieldOption(
                        value: 'otherDuration',
                        child: FormBuilderTextField(
                          name: 'otherDuration',
                          decoration: InputDecoration(
                            labelText: 'Other',
                          ),
                          onChanged: (value) {},
                          // valueTransformer: (text) => num.tryParse(text),

                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ProgressButton(
                
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      var formData = _formKey.currentState!.value;
                      var projectFormModel = ProjectFormModel(affiliation: formData["otherAffiliation"] ?? formData["affiliation"],
                          description: formData["description"],
                          duration: formData["otherDuration"] ?? formData["duration"],
                          email: formData["email"],
                          name: formData["name"],
                          tags: formData["tags"]);
                     await addProjectRequest(projectFormModel);

                    } else {
                      print("validation failed");
                    }
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: MaterialButton(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Text(
                    "Reset",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _formKey.currentState!.reset();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
