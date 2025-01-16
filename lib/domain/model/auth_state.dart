import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_dashboard/data/uitls/exception.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthStatus with _$AuthStatus {
  const factory AuthStatus.initial() = Initial;
  const factory AuthStatus.loading() = Loading;
  const factory AuthStatus.failure(AppException exception) = Failure;
  const factory AuthStatus.success() = Success;
}
