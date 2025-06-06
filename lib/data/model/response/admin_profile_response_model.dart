import 'dart:convert';

class Mahasiswa {
    final String? message;
    final int? statusCode;
    final Data? data;

    Mahasiswa({
        this.message,
        this.statusCode,
        this.data,
    });

    factory Mahasiswa.fromRawJson(String str) => Mahasiswa.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        message: json["message"],
        statusCode: json["status_code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
        "data": data?.toJson(),
    };
}

class Data {
    final int? id;
    final String? name;

    Data({
        this.id,
        this.name,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
