import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String s, {required super.message});
}

class CacheFailure extends Failure {
  const CacheFailure(String s, {required super.message});
}
