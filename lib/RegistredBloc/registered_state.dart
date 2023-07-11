part of 'registered_bloc.dart';

abstract class RegisteredState extends Equatable {
  const RegisteredState();

  @override
  List<Object> get props => [];
}

class RegisteredInitial extends RegisteredState {}

class RegisteredLoading extends RegisteredState {}

class RegistredSuccess extends RegisteredState {}

class RegistredError extends RegisteredState {
  final String errorMassage;

  const RegistredError(this.errorMassage);
  @override
  List<Object> get props => [errorMassage];
}
