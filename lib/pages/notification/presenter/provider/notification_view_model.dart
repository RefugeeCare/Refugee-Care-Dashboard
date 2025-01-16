import 'package:refugee_dashboard/domain/provider/customer_repository_provider.dart';
import 'package:refugee_dashboard/pages/notification/model/refugee_notification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_view_model.g.dart';

@riverpod
class NotificationViewModel extends _$NotificationViewModel {
  @override
  Future<List<RefugeeNotification>> build() async {
    return await fetchNotifications();
  }

  Future<List<RefugeeNotification>> fetchNotifications() async {
    final result =
        await ref.read(customerRepositoryProvider).fetchRefugeeNotifications();
    return result.fold((error) {
      throw error;
    }, (data) {
      return data;
    });
  }

  Future<void> addNewNotification(RefugeeNotification notification) async {
    final result = await ref
        .read(customerRepositoryProvider)
        .createNotification(notification);
    result.fold((error) {
      throw error;
    }, (data) {
      state = AsyncData(data);
    });
  }

  Future<void> setAsRead(RefugeeNotification notification) async {
    // if (notification.isRead) {
    //   debugPrint("${notification.title} is already read");
    //   return;
    // }
    // state = await AsyncValue.guard(() async {
    //   final result = await ref
    //       .read(profileRepositoryProvider)
    //       .setNotiAsRead(notification.id);
    //   return result.fold((error) {
    //     throw error;
    //   }, (data) {
    //     return data.isNotEmpty ? data : state.requireValue;
    //   });
    // });
  }

  // Future<void> refreshNotifications() async {
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(() => fetchNotifications());
  // }
}
