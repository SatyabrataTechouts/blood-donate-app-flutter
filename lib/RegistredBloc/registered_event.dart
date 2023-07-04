import 'package:equatable/equatable.dart';
import 'package:help_app/model/registred_model.dart';

abstract class RegisteredEvent extends Equatable {
  const RegisteredEvent();

  @override
  List<Object> get props => [];
}

class AddUserEvent extends RegisteredEvent {
  final RegistredUser user;

  const AddUserEvent(this.user);
}
