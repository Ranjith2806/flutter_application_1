import 'package:cloud_firestore/cloud_firestore.dart';

class Videos{
  final String name;
  final String url;
  final String cover_pic;

  Videos({
    required this.name,
    required this.url,
    required this.cover_pic,
  });

  Map<String, dynamic> toJson() => {

    'name' : name,
    'url' : url,
    'cover_pic' : cover_pic,
  };

  static Videos fromJson(Map<String, dynamic> json) => Videos(
    name: json['name'],
    url: json['url'],
    cover_pic: json['cover_pic'],
  );
}