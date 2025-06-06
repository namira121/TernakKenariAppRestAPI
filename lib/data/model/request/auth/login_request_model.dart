import 'dart:convert';

class LoginModelRequest {
    final String? email;
    final String? password;

    LoginModelRequest({
        this.email,
        this.password,
    });

    factory LoginModelRequest.fromJson(String str) => LoginModelRequest.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginModelRequest.fromMap(Map<String, dynamic> json) => LoginModelRequest(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
    };
}
