import 'package:flutter/material.dart';
import 'package:refugee_dashboard/data/services/app_write_client_provider.dart';
import 'package:refugee_dashboard/data/uitls/exception.dart';
import 'package:refugee_dashboard/domain/model/auth_state.dart';
import 'package:refugee_dashboard/pages/splash/provider/state/splash_scrren_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'splah_screen_provider.g.dart';

// final splashScreenProvider =
//     StateNotifierProvider<SplashScreenNotifier, SplashScreenState>((ref) {
//   var authRepository = ref.watch(authRepositoryProvider);
//   return SplashScreenNotifier(authRepository: authRepository);
// });

@riverpod
class SplashScreenViewModel extends _$SplashScreenViewModel {
  //
  @override
  SplashState build() {
    return SplashState();
  }

  void initAuthState() async {
    try {
      // final authRepository = ref.read(authRepositoryProvider);
      final account = ref.watch(accountProvider);
      state = state.copyWith(authState: const AuthStatus.loading());
      final session = await account
          .getSession(sessionId: 'current')
          .onError((error, stackTrace) {
        debugPrint("error:$error");
        debugPrint("trace:$stackTrace");
        throw Exception("Error occurred during account registration");
      });
      if (session.current) {
        // debugPrint(authRepository.getUser()?.token);
        state = state.copyWith(authState: const Success());
      } else {
        state = state.copyWith(
            authState: AuthStatus.failure(AppException(
                title: "",
                message: "No access token",
                identifier: "",
                statusCode: 401)));
      }
    } catch (e, stackTrace) {
      debugPrint("Exception caught: $e");
      debugPrint("Stack trace: $stackTrace");
      state = state.copyWith(
          authState: AuthStatus.failure(AppException(
              title: "Error",
              message: e.toString(),
              identifier: "",
              statusCode: 500)));
    }
  }
}
