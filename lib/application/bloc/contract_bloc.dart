import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contract_users/domain/models/contract_model.dart';
import 'package:flutter_contract_users/domain/repositories/contract_repository.dart';
part 'contract_event.dart';
part 'contract_state.dart';

class ContractBloc extends Bloc<ContractEvent, ContractState> {
  final ContractRepository repository;
  ContractBloc(this.repository) : super(ContractInitial()) {
    on<GetContractEvent>((event, emit) async {
      emit(ContractStateLoading());
      final successOrFail = await repository.getDataSuccessOrFailure();
      await successOrFail.fold(
        (failure) async =>
            emit(ContractStateError(message: failure.toString())),
        (contracts) async => emit(GetContractSuccess(listContracts: contracts)),
      );
    });
  }
}
