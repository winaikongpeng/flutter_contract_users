part of 'contract_bloc.dart';

abstract class ContractState {}

class ContractInitial extends ContractState {}

class ContractStateLoading extends ContractState {}

class GetContractSuccess extends ContractState {
  final ContractModel listContracts;
  GetContractSuccess({required this.listContracts});
}

class ContractStateError extends ContractState {
  final String message;
  ContractStateError({required this.message});
}
