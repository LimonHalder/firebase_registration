import 'package:bloc/bloc.dart';
import 'package:succes_project/login/bloc/login_event.dart';
import 'package:succes_project/login/bloc/login_state.dart';
import 'package:succes_project/repositories/user_repositories.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;
  LoginBloc({this.userRepository, Type UserRepository}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SignInButtonPressed) {
      yield LoginLoading();

      try {
        var user = await userRepository.signIn(event.email, event.password);
        yield LoginSucced(user: user);
      } catch (e) {
        yield LoginFailed(message: e.toString());
      }
    }
  }
}