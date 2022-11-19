// To parse this JSON data, do
//
//     final PetModel = PetModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names, prefer_if_null_operators


import 'dart:convert';

PetModel PetModelFromJson(String str) => PetModel.fromJson(json.decode(str));

String PetModelToJson(PetModel data) => json.encode(data.toJson());

class PetModel {
  PetModel({
    required this.age,
    required this.category,
    required this.gender,
    required this.images,
    required this.name,
    required this.status,
    required this.type,
    required this.about,
    required this.detail,
    required this.thumbnail,
  });

  Map<String, dynamic>? about;
  List<String>? detail;
  String age;
  String category;
  String gender;
  List<Images> images;
  List<Thumbnail> thumbnail;
  String name;
  String status;
  String type;

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      PetModel(
          age: json["age"],
          category: json["category"],
          gender: json["gender"],
          images: List<Images>.from(
              json["images"].map((x) => Images.fromJson(x))),
          thumbnail: List<Thumbnail>.from(
              json["thumbnail"].map((x) => Thumbnail.fromJson(x))),
          name: json["name"],
          status: json["status"],
          type: json["type"],
          about: json.containsKey("about") ? json["about"] : "",
          detail: json['detail'] == null
              ? null
              : json["detail"] //List<String>.from(json["detail"].map((x) => x.toString())),
      );

  Map<String, dynamic> toJson() =>
      {
        "age": age,
        "category": category,
        "gender": gender,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "thumbnail": List<dynamic>.from(thumbnail.map((x) => x.toJson())),
        "name": name,
        "status": status,
        "type": type,
        "about": about,
        "detail": List<dynamic>.from(detail!.map((x) => x)),
      };
}

class Detail {
  Detail({
    required this.detail,
  });

  List<String> detail;

  factory Detail.fromJson(Map<String, dynamic> json) =>
      Detail(
        detail: List<String>.from(json["detail"].map((x) => x)),
      );

  Map<String, dynamic> toJson() =>
      {
        "detail": List<dynamic>.from(detail.map((x) => x)),
      };
}

class Images {
  Images({
    required this.downloadURL,
  });

  String downloadURL;

  factory Images.fromJson(Map<String, dynamic> json) =>
      Images(
        downloadURL: json["downloadURL"],
      );

  Map<String, dynamic> toJson() =>
      {
        "downloadURL": downloadURL,
      };
}

class Thumbnail {
  Thumbnail({
    required this.downloadUrl,
  });

  String downloadUrl;

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      Thumbnail(
        downloadUrl: json["downloadURL"],
      );

  Map<String, dynamic> toJson() =>
      {
        "downloadURL": downloadUrl,
      };
}