import 'dart:convert';

class Welcome {
    final String? message;
    final int? statusCode;
    final User? data;

    Welcome({
        this.message,
        this.statusCode,
        this.data,
    });

    factory Welcome.fromJson(String str) => Welcome.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
        message: json["message"],
        statusCode: json["status_code"],
        data: json["data"] == null ? null : User.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "status_code": statusCode,
        "data": data?.toMap(),
    };
}

class User {
    final int? id;
    final String? name;
    final String? email;
    final String? role;
    final String? token;

    User({
        this.id,
        this.name,
        this.email,
        this.role,
        this.token,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "token": token,
    };
}
