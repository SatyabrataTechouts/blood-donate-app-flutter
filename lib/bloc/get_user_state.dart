import 'package:equatable/equatable.dart';

abstract class GetUserState extends Equatable {
  const GetUserState();

  @override
  List<Object> get props => [];
}

class GetUserInitial extends GetUserState {}

class GetUserLoading extends GetUserState {}

class GetUserLoaded extends GetUserState {
  final List<dynamic> data;
  const GetUserLoaded(this.data);
}

class GetUserError extends GetUserState {}
