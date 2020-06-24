import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc(this._userRepository);

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedEventToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedEventToState() async* {
    try {
      //check if user is authenticated
      if (!await _userRepository.isAuthenticated()) {
        await _userRepository.authenticated();
      }
      //if not autheticated then authenticate

      //if not able to authenticate, return unauthennticated state
      final userId = await _userRepository.getUserId();
      if (userId != null) {
        yield Authenticated(userId: userId);
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }
}
