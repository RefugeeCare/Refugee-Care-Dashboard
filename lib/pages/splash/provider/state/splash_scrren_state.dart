import 'package:equatable/equatable.dart';
import 'package:refugee_dashboard/domain/model/auth_state.dart';

class SplashState extends Equatable {
  final bool loading;
  final String name;
  final AuthStatus authState;

  const SplashState({
    this.loading = false,
    this.name = "",
    this.authState = const AuthStatus.initial(),
  });

  SplashState copyWith({
    bool? loading,
    String? name,
    AuthStatus? authState,
  }) {
    return SplashState(
      loading: loading ?? this.loading,
      name: name ?? this.name,
      authState: authState ?? this.authState,
    );
  }

  @override
  List<Object?> get props => [loading, name, authState];

  @override
  String toString() {
    return 'SplashScreenState(loading: $loading, name: $name, authState: $authState)';
  }
}
