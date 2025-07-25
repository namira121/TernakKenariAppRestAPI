import 'dart:convert';

class RegisterRequestModel {
    final String? username;
    final String? email;
    final String? password;
    final String? passwordConfirmation;
    final int? roleId;

    RegisterRequestModel({
        this.username,
        this.email,
        this.password,
        this.passwordConfirmation,
        this.roleId,
    });

    factory RegisterRequestModel.fromRawJson(String str) => RegisterRequestModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toMap());

    factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => RegisterRequestModel(
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
