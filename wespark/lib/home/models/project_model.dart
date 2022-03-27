class ProjectModel {
  ProjectModel(
      {required this.title,
      required this.description,
      required this.duration,
      required this.id,
      required this.tags,
      required this.name,
      required this.clientEmail});

  final String title;
  final String description;
  final String duration;
  final String id;
  final List tags;
  final String name;
  final String clientEmail;


  factory ProjectModel.fromFirebase(Map<String, dynamic> json,String id) {
    return ProjectModel(
      id: id,
      title: json['title']??"No title specified",
      description: json['description']??"No description specified",
      duration: json['duration']?? "No duration specified",
      tags: json['tags']??[] ,
      name: json['name']?? "No name specified",
      clientEmail: json['clientEmail']?? "No clientEmail specified",
    );
  }

  Map toJson(){
    return {
      'id': id,
      'title': title,
      'description': description,
      'duration': duration,
      'tags': tags,
      'name': name,
      'clientEmail': clientEmail,
    };
  }
}
