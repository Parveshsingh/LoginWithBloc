import 'package:demo/states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LoginEvent { login }

enum LoginState { success, error, loading }

class LoginBloc extends Bloc<BlocEvent, ParentState> {

  LoginBloc() : super(InitState()) {
    on((BlocEvent event, emit)async {
      switch (event.event) {
        case LoginEvent.login:
          {
            emit(BlocState(state: LoginState.loading));
            try {
              await Future.delayed(const Duration(seconds: 1), () {
                emit(BlocState(state: LoginState.success));
              });
            } catch (e) {
              emit(BlocState(state: LoginState.error));
            }
          }
      }
    });
  }
}
