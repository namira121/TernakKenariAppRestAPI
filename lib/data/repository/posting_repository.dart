import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:canary_project/data/model/request/admin/posting_jual_request_model.dart';
import 'package:canary_project/data/model/response/burung_semua_tersedia_model.dart';
import 'package:canary_project/data/model/response/get_all_burung_response_model.dart';
import 'package:canary_project/service/service_http_client.dart';
import 'package:dartz/dartz.dart';

class PostingRepository {
  final ServiceHttpClient _serviceHttpClient;
  PostingRepository(this._serviceHttpClient);

  Future<Either<String, BurungSemuaTersediabyIdModel>> addPostBurung(
    PostingJualRequestModel requestModel,
  ) async {
    try {
      final response =await _serviceHttpClient.postWithToken(
        "admin/posting-jual", 
        requestModel.toJson(),
      );
      final jsonResponse = json.decode(response.body);
      if(response.statusCode == 201) {
        final profilResponse = BurungSemuaTersediabyIdModel.fromJson(
          jsonResponse,
        );
        log("Add burung Successful: ${profilResponse.message}");
        return Right(profilResponse);
      }else{
        log("Add burung failed: $jsonResponse['message]");
        return Left(jsonResponse['message'] ?? "Add burung failed");
      }
    }catch(e){
      log("Error in Add Burung: $e");
      return Left("An eror occurred while posting burung");
    }
  }

  Future<Either<String, GetAllBurungModel>> getAllBurung() async {
    try{
      final response = await _serviceHttpClient.get("admin/burung-semua");
      if(response.statusCode == 200){
        final jsonResponse = json.decode(response.body);
        final GetAllBurung = GetAllBurungModel.fromMap(jsonResponse);

        return Right(getAllBurung);
      } else {
        final jsonResponse = json.decode(response.body);
        
        return Left(jsonResponse['message']?? "Get All burung failed");
      }
    }catch(e){
      return Left("An error occured while getting all buruning")
    }
  }
}