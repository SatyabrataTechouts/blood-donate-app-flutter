part of 'org_bloc.dart';

abstract class OrgEvent extends Equatable {
  const OrgEvent();

  @override
  List<Object> get props => [];
}

class OrgAdd extends OrgEvent {
  final OrgModel user;

  const OrgAdd(this.user);
}
