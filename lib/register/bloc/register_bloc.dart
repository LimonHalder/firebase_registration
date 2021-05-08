import 'package:bloc/bloc.dart';

import 'package:succes_project/register/bloc/register_event.dart';
import 'package:succes_project/register/bloc/register_state.dart';
import 'package:succes_project/repositories/user_repositories.dart';
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository userRepository;
  RegisterBloc({this.userRepository}) : super(RegisterInitial());
 
  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is SignUpButtonPressed) {
      yield RegisterLoading();

      try {
        var user = await userRepository.signUp(event.email, event.password);
        yield RegisterSucced(user: user);
      } catch (e) {
        yield RegisterFailed(message: e.toString());
      }
    }
  }
}



