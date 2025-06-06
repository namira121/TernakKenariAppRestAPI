import 'package:canary_project/data/repository/auth_repository.dart';
import 'package:canary_project/presentation/auth/bloc/login/login_event.dart';
import 'package:canary_project/presentation/auth/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<RegisterState> emit,
  )async{
    emit(RegisterLoading());

    final result =await authRepository.register(event.requestModel);

    result.fold(
      (l) => emit(RegisterFailure(error: l)),
      (r) => emit(RegisterSuccess(message: r)),
    );
  }
}