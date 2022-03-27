class ProjectFormModel {
  ProjectFormModel(
      {required this.name,
      required this.email,
      required this.affiliation,
      required this.id,
      required this.tags,
      required this.description,
      required this.duration});

  final String name;
  final String description;
  final String duration;
  final List tags;
  final String affiliation;
  final String email;
 final String id;

  factory ProjectFormModel.fromFirebase(Map<String, dynamic> json,String id) {
    return ProjectFormModel(
     id: id,
      affiliation: json['affiliation']??"No affiliation specified",
      description: json['description']??"No description specified",
      duration: json['duration']?? "No duration specified",
      tags: json['tags']??[],
      name: json['name']?? "No name specified",
      email: json['clientEmail']?? "No clientEmail specified",
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'affiliation': affiliation,
      'description': description,
      'duration': duration,
      'tags': tags,
      'name': name,
      'clientEmail': email,
    };
  }
}
