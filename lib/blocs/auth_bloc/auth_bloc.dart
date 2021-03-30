import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
