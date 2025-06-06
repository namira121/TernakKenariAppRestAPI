import 'dart:convert';
import 'dart:developer';
import 'package:canary_project/data/model/response/admin_profile_response_model.dart';
import 'package:canary_project/service/service_http_client.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileAdminRepository {
  final ServiceHttpClient _serviceHttpClient;
  final secureStorage = FlutterSecureStorage();

  ProfileAdminRepository(this._serviceHttpClient);

  Future<Either<String, AdminProfileResponseModel>> addProfile(
    AdminProfileResponseModel requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.postWithToken(
        'admin/profile',
        requestModel.toMap(),
      );
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 201){
        final profileResponse = AdminProfileResponseModel.fromMap(jsonResponse);
        log("Add Admin Profile Successful: ${profileResponse.message}");
        return Right(profileResponse);
      } else {
        log("Add Admin Profile failed: ${jsonResponse['message']}");
        return Left(jsonResponse['message'] ?? "Create Profile failed");
      }
    }catch(e){
      log("Error in adding: $e");
      return Left("An error occurred while adding profile: $e");
    }
  }

  Future<Either<String, AdminProfileResponseModel>> getProfile() async {
    try{
      final response = await _serviceHttpClient.get("admin/profile");
      if(response.statusCode == 200){
        final jsonResponse = json.decode(response.body);
        final profileResponse = AdminProfileResponseModel.fromMap(jsonResponse);
        log("Get Admin Profile successful: ${profileResponse.message}");
        return Right(profileResponse);
      } else {
        final jsonResponse = json.decode(response.body);
        log("Get Admin Profile failed: ${jsonResponse['message']}");
        return Left(jsonResponse['message'] ?? "Get Profile failed");
      }
    } catch (e){
      log("Error in getting profile: $e");
      return Left("An error occurred while getting profile: $e");
    }
  }
}