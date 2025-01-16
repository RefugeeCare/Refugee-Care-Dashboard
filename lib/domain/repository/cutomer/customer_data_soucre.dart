import 'package:flutter/material.dart';
import 'package:refugee_dashboard/data/uitls/either.dart';
import 'package:refugee_dashboard/pages/notification/model/refugee_notification.dart';

abstract class CustomerRepository {
  Future<Either<Exception, List<RefugeeNotification>>>
      fetchRefugeeNotifications();
  Future<Either<Exception, List<RefugeeNotification>>> createNotification(
      RefugeeNotification notification);
  Future<Either<Exception, List<RefugeeNotification>>> deleteNotification(
      RefugeeNotification notification);
  // Future<Either<Exception, List<Advertisement>>> fetchAdvertisements();
  // Future<Either<Exception, List<Directory>>> fetchDirectories(
  //     List<String> tags);
}
