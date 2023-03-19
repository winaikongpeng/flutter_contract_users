abstract class ContractFailure {}

class ServerError extends ContractFailure {
  final String message;
  ServerError({required this.message});
  @override
  String toString() => message;
}

class UnknownError extends ContractFailure {
  final String message;
  UnknownError({required this.message});
  @override
  String toString() => message;
}
