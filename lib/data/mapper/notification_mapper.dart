import 'package:refugee_dashboard/data/model/customer/refugee_notification_data.dart';
import 'package:refugee_dashboard/pages/notification/model/refugee_notification.dart';
import 'package:refugee_dashboard/shared/extensions/data_formatter.dart';

extension RefugeeNotificationDataMapper on RefugeeNotificationData {
  RefugeeNotification toDomain() {
    return RefugeeNotification(
      id: id ?? '',
      title: title ?? '',
      description: description ?? '',
      communityId: communityId ?? '',
      active: active ?? false,
      expiredDate: changeFormatDate(
          expiredDate ?? '', "yyyy-MM-ddTHH:mm", "dd MMM yyyy"),
      createdAt:
          changeFormatDate(createdAt ?? '', "yyyy-MM-ddTHH:mm", "dd MMM yyyy"),
      communityName: communityData?.name ?? '',
      communityShortName: communityData?.shortName ?? '',
    );
  }
}

extension RefugeeNotificationMapper on RefugeeNotification {
  RefugeeNotificationData toData() {
    return RefugeeNotificationData(
      id: id,
      title: title,
      description: description,
      communityId: communityId,
      active: active,
      expiredDate:
          changeFormatDate(expiredDate, "dd MMM yyyy", "yyyy-MM-ddTHH:mm"),
      createdAt: changeFormatDate(createdAt, "dd MMM yyyy", "yyyy-MM-ddTHH:mm"),
      // communityData: CommunityData(
      //   name: communityName,
      //   shortName: communityShortName,
      // ),
    );
  }
}
