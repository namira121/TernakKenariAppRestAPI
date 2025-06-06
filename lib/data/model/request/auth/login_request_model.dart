import 'dart:convert';

class Welcome {
    final String? email;
    final String? password;

    Welcome({
        this.email,
        this.password,
    });

    factory Welcome.fromJson(String str) => Welcome.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
    };
}
