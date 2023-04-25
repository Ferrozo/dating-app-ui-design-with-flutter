// To parse this JSON data, do
//
//     final wserModel = wserModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.users,
  });

  List<User> users;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.isFavorite,
    required this.img,
    required this.history,
    required this.location,
    required this.percentMatch,
    required this.isOnline,
    required this.messages,
  });

  String firstName;
  String lastName;
  int age;
  bool isFavorite;
  String img;
  List<dynamic> history;
  Location location;
  int percentMatch;
  bool isOnline;
  List<Message> messages;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        age: json["age"],
        isFavorite: json["isFavorite"],
        img: json["img"],
        history: List<dynamic>.from(json["history"].map((x) => x)),
        location: locationValues.map[json["Location"]]!,
        percentMatch: json["percentMatch"],
        isOnline: json["isOnline"],
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "age": age,
        "isFavorite": isFavorite,
        "img": img,
        "history": List<dynamic>.from(history.map((x) => x)),
        "Location": locationValues.reverse[location],
        "percentMatch": percentMatch,
        "isOnline": isOnline,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
      };
}

enum Location { PARIS_FR, LONDON_ENG, NEW_YORK_US }

final locationValues = EnumValues({
  "London, ENG": Location.LONDON_ENG,
  "New York, US": Location.NEW_YORK_US,
  "Paris, FR": Location.PARIS_FR
});

class Message {
  Message({
    required this.object,
    required this.time,
    required this.isSender,
  });

  String object;
  String time;
  bool isSender;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        object: json["object"],
        time: json["time"],
        isSender: json["isSender"],
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "time": time,
        "isSender": isSender,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
