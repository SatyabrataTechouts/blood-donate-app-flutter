part of 'get_org_bloc.dart';

abstract class GetOrgState extends Equatable {
  const GetOrgState();

  @override
  List<Object> get props => [];
}

class GetOrgInitial extends GetOrgState {}

class GetOrgLoading extends GetOrgState {}

class GetOrgLoaded extends GetOrgState {
  final List data;
  const GetOrgLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class GetOrgError extends GetOrgState {
  final String errorMassage;

  const GetOrgError(this.errorMassage);
  @override
  List<Object> get props => [errorMassage];
}
