import 'dart:convert';

class Welcome {
    final String? username;
    final String? email;
    final String? password;
    final String? passwordConfirmation;
    final int? roleId;

    Welcome({
        this.username,
        this.email,
        this.password,
        this.passwordConfirmation,
        this.roleId,
    });

    factory Welcome.fromJson(String str) => Welcome.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        roleId: json["role_id"],
    );

    Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "role_id": roleId,
    };
}
