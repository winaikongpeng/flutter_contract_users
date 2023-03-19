import 'package:dartz/dartz.dart';
import 'package:flutter_contract_users/data/contract_remote_data.dart';
import 'package:flutter_contract_users/domain/contract_failure.dart';
import '../models/contract_model.dart';

class ContractRepository {
  final ContractRemoteData _remoteData = ContractRemoteData();

  Future<Either<ContractFailure, ContractModel>>
      getDataSuccessOrFailure() async {
    return await _remoteData.getDataFromApi();
  }
}
