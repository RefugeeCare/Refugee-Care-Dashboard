import 'package:flutter/material.dart';
import 'package:refugee_dashboard/pages/authentication/data/provider/auth_repository_provider.dart';
import 'package:refugee_dashboard/pages/authentication/presenter/provider/state/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  AuthState build() {
    return AuthState();
  }

  Future<void> login(String phoneNumber, String password) async {
    try {
      debugPrint('login starting...');
      final authRepository = ref.watch(authRepositoryProvider);
      // if (phoneNumber.isEmpty || password.isEmpty) {
      //   state =
      //       state.copyWith(errorMessage: 'Email and Password cannot be empty');
      //   return;
      // }

      state = AuthState(isLoading: true);
      final response = await authRepository.login(
          phoneNumber: phoneNumber, password: password);
      response.fold((failure) {
        debugPrint(failure.message.toString());
        state = state.copyWith(errorMessage: failure.message, isLoading: false);
      }, (user) async {
        debugPrint(user.name.toString());
        // await authRepository.saveUser(user: user);
        state = state.copyWith(isLoggedIn: true, isLoading: false);
      });
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
}
