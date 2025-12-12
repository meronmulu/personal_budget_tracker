import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_budget_tracker/features/auth/domain/repositories/auth_repository.dart';
import 'package:personal_budget_tracker/features/auth/presentation/bloc/auth_events.dart';
import 'package:personal_budget_tracker/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthIntial()) {
    on<RegisterRequested>((event, emit) async {
      print("Register event received");
      emit(AuthLoading());
      try {
        final user = await repository.register(
          name: event.name,
          email: event.email,
          password: event.password,
        );
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await repository.login(
          email: event.email,
          password: event.password,
        );
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
