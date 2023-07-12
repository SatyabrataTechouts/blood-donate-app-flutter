part of 'get_org_bloc.dart';

abstract class GetOrgEvent extends Equatable {
  const GetOrgEvent();

  @override
  List<Object> get props => [];
}

class GetOrgData extends GetOrgEvent {}
