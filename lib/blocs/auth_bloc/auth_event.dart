import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;
  const LoggedIn({@required this.token}) : assert(token != null);
  @override
  List<Object> get props => [token];

  @override
  String toString() {
    return "LoggedIn with token: {$token}";
  }
}
