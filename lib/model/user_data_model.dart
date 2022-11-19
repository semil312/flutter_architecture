import 'dart:convert';

List<UserDataModal> userDataModalFromJson(String str) =>
    List<UserDataModal>.from(
        json.decode(str).map((x) => UserDataModal.fromJson(x)));

String userDataModalToJson(List<UserDataModal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDataModal {
  UserDataModal({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory UserDataModal.fromJson(Map<String, dynamic> json) =>
      UserDataModal(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}
