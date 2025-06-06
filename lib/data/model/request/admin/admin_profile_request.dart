import 'dart:convert';

class AdminProfileRequestModel {
    final String? name;

    AdminProfileRequestModel({
        this.name,
    });

    factory AdminProfileRequestModel.fromRawJson(String str) => AdminProfileRequestModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AdminProfileRequestModel.fromJson(Map<String, dynamic> json) => AdminProfileRequestModel(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
