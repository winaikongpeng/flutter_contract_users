import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_contract_users/domain/contract_failure.dart';
import 'package:flutter_contract_users/domain/models/contract_model.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ContractRemoteData {
  static const uri = 'https://randomuser.me/api/?results=100';

  Future<Either<ContractFailure, ContractModel>> getDataFromApi() async {
    try {
      final res = await http.get(Uri.parse(uri));
      if (res.statusCode == HttpStatus.ok) {
        return Right(ContractModel.fromJson(json.decode(res.body)));
      } else {
        return Left(ServerError(message: res.body.toString()));
      }
    } catch (e) {
      return Left(UnknownError(message: e.toString()));
    }
  }
}
