import 'dart:convert';

ContractModel contracModelFromJson(String str) =>
    ContractModel.fromJson(json.decode(str));

String contracModelToJson(ContractModel data) => json.encode(data.toJson());

class ContractModel {
  ContractModel({
    required this.contracts,
  });

  final List<Contract> contracts;

  factory ContractModel.fromJson(Map<String, dynamic> json) => ContractModel(
        contracts: List<Contract>.from(
            json["results"].map((x) => Contract.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "contract": List<dynamic>.from(contracts.map((x) => x.toJson())),
      };
}

class Contract {
  Contract({
    required this.name,
    required this.email,
    required this.phone,
    required this.picture,
  });

  final Name name;
  final String email;
  final String phone;
  final Picture picture;

  factory Contract.fromJson(Map<String, dynamic> json) => Contract(
        name: Name.fromJson(json["name"]),
        email: json["email"],
        phone: json["phone"],
        picture: Picture.fromJson(json["picture"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "email": email,
        "phone": phone,
        "picture": picture.toJson(),
      };
}

class Name {
  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  final String title;
  final String first;
  final String last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  final String large;
  final String medium;
  final String thumbnail;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
