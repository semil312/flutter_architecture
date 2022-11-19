// import 'dart:convert';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// EventModel eventModelFromJson(String str) =>
//     EventModel.fromJson(json.decode(str));
//
// String eventModelToJson(EventModel data) => json.encode(data.toJson());
//
// class EventModel {
//   EventModel({
//     required this.description,
//     required this.eventDate,
//     required this.thumbnail,
//     required this.websiteLink,
//     required this.address,
//   });
//
//   Address address;
//   String websiteLink;
//   String description;
//   Timestamp eventDate;
//   List<Thumbnail> thumbnail;
//
//   factory EventModel.fromJson(Map<String, dynamic> json) =>
//       EventModel(
//         address: Address.fromJson(json["address"]),
//         description: json["description"],
//         eventDate: json["event_date"],
//         websiteLink: json["website_link"],
//         thumbnail: List<Thumbnail>.from(
//             json["thumbnail"].map((x) => Thumbnail.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() =>
//       {
//         "address": address.toJson(),
//         "website_link": websiteLink,
//         "description": description,
//         "event_date": eventDate,
//         "thumbnail": List<dynamic>.from(thumbnail.map((x) => x.toJson())),
//       };
// }
//
// class Thumbnail {
//   Thumbnail({
//     required this.downloadUrl,
//   });
//
//   String downloadUrl;
//
//   factory Thumbnail.fromJson(Map<String, dynamic> json) =>
//       Thumbnail(
//         downloadUrl: json["downloadURL"],
//       );
//
//   Map<String, dynamic> toJson() =>
//       {
//         "downloadURL": downloadUrl,
//       };
// }
//
// class Address {
//   Address({
//     required this.description,
//     required this.location,
//   });
//
//   String description;
//   String location;
//
//   factory Address.fromJson(Map<String, dynamic> json) =>
//       Address(
//         description: json["description"],
//         location: json["location"],
//       );
//
//   Map<String, dynamic> toJson() =>
//       {
//         "description": description,
//         "location": location,
//       };
// }

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  EventModel({
    required this.address,
    required this.description,
    required this.eventDate,
    required this.sponseredBy,
    required this.thumbnail,
    required this.websiteLink,
    required this.name,
  });

  Address address;
  String description;
  String name;
  Timestamp eventDate;
  SponseredBy sponseredBy;
  List<Thumbnail> thumbnail;
  String websiteLink;

  factory EventModel.fromJson(Map<dynamic, dynamic> json) => EventModel(
        address: Address.fromJson(json["address"]),
        description: json["description"],
        eventDate: json["event_date"],
        sponseredBy: SponseredBy.fromJson(json["sponsered_by"]),
        thumbnail: List<Thumbnail>.from(
            json["thumbnail"].map((x) => Thumbnail.fromJson(x))),
        websiteLink: json["website_link"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "description": description,
        "event_date": eventDate,
        "sponsered_by": sponseredBy.toJson(),
        "thumbnail": List<dynamic>.from(thumbnail.map((x) => x.toJson())),
        "website_link": websiteLink,
        "name": name,
      };
}

class Address {
  Address({
    required this.description,
    required this.location,
  });

  String description;
  GeoPoint location;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        description: json["description"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "location": location,
      };
}

class SponseredBy {
  SponseredBy({
    required this.link,
    required this.name,
  });

  String link;
  String name;

  factory SponseredBy.fromJson(Map<String, dynamic> json) => SponseredBy(
        link: json["link"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "name": name,
      };
}

class Thumbnail {
  Thumbnail({
    required this.downloadURL,
  });

  String downloadURL;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        downloadURL: json["downloadURL"],
      );

  Map<String, dynamic> toJson() => {
        "downloadURL": downloadURL,
      };
}
