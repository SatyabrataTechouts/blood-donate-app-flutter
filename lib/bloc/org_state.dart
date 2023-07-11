part of 'org_bloc.dart';

abstract class OrgState extends Equatable {
  const OrgState();

  @override
  List<Object> get props => [];
}

class OrgInitial extends OrgState {}

class OrgLading extends OrgState {}

class OrgLoaded extends OrgState {}

class OrgError extends OrgState {
  final String errorMassage;

  const OrgError(this.errorMassage);
  List<Object> get props => [errorMassage];
}
