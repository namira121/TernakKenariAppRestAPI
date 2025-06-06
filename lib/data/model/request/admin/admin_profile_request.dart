import 'dart:convert';

class Mahasiswa {
    final String? name;

    Mahasiswa({
        this.name,
    });

    factory Mahasiswa.fromRawJson(String str) => Mahasiswa.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}