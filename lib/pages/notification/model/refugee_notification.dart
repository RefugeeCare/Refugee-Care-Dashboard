import 'package:freezed_annotation/freezed_annotation.dart';

part 'refugee_notification.freezed.dart';
part 'refugee_notification.g.dart';

@freezed
class RefugeeNotification with _$RefugeeNotification {
  const factory RefugeeNotification({
    @Default('') String id,
    @Default('') String title,
    @Default('') String description,
    @Default(false) bool active,
    @Default('') String expiredDate,
    @Default('') String createdAt,
    @Default('') String communityId,
    @Default('') String communityName,
    @Default('') String communityShortName,
  }) = _RefugeeNotification;

  factory RefugeeNotification.fromJson(Map<String, dynamic> json) =>
      _$RefugeeNotificationFromJson(json);
}
