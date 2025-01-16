import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:refugee_dashboard/data/mapper/notification_mapper.dart';
import 'package:refugee_dashboard/data/model/customer/refugee_notification_data.dart';
import 'package:refugee_dashboard/data/uitls/either.dart';
import 'package:refugee_dashboard/data/uitls/exception.dart';
import 'package:refugee_dashboard/domain/repository/cutomer/customer_data_soucre.dart';
import 'package:refugee_dashboard/main/appConfig/app_env.dart';
import 'package:refugee_dashboard/pages/notification/model/refugee_notification.dart';
import 'package:refugee_dashboard/shared/storage/hive_helper.dart';

class CustomerRepositoryImpl extends CustomerRepository {
  final Account account;
  final Databases databases;
  final HiveHelper hiveHelper;

  CustomerRepositoryImpl(this.account, this.databases, this.hiveHelper);
  @override
  @override
  Future<Either<Exception, List<RefugeeNotification>>>
      fetchRefugeeNotifications() async {
    try {
      return databases.listDocuments(
        databaseId: EnvInfo.databaseId,
        collectionId: EnvInfo.notificationCollectionId,
        queries: [
          // Query.select(['name', '\$id', 'shortName']),
        ],
      ).then((value) {
        final list = value.documents
            .map((e) => RefugeeNotificationData.fromJson(e.data));
        debugPrint(value.toMap().toString());

        final notifications = list.map((data) => data.toDomain()).toList();
        return Either.right(notifications);
      });
    } catch (error) {
      return Left(AppException(
        message: 'Unknown error occurred while creating card',
        statusCode: 499,
        title: "Unknown error",
        identifier: '${error.toString()}\ncardCreate',
      ));
    }
  }

  @override
  Future<Either<Exception, List<RefugeeNotification>>> createNotification(
      RefugeeNotification notification) async {
    try {
      final document = await databases.createDocument(
        databaseId: EnvInfo.databaseId,
        collectionId: EnvInfo.notificationCollectionId,
        documentId: ID.unique(),
        data: {
          "title": notification.title,
          "description": notification.description,

          // "\$id": ID.unique(),
          "expriedDate": DateTime.now().toIso8601String(),
          "isPublic": true
          // "community":
        },
      );

      final createdNotification =
          RefugeeNotificationData.fromJson(document.data).toDomain();
      var notifications = await fetchRefugeeNotifications();
      List<RefugeeNotification> list = notifications.fold((left) {
        return [createdNotification].toList();
      }, (data) {
        return data;
      });
      return Either.right(list);
    } catch (error) {
      return Left(AppException(
        message: 'Unknown error occurred while creating notification',
        statusCode: 499,
        title: "Unknown error",
        identifier: '${error.toString()}\nnotificationCreate',
      ));
    }
  }

  @override
  Future<Either<Exception, List<RefugeeNotification>>> deleteNotification(
      RefugeeNotification notification) {
    // TODO: implement deleteNotification
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Exception, List<Advertisement>>> fetchAdvertisements() async {
  //   try {
  //     return databases.listDocuments(
  //       databaseId: EnvInfo.databaseId,
  //       collectionId: EnvInfo.advertisementCollectionId,
  //       queries: [],
  //     ).then((value) {
  //       final list =
  //           value.documents.map((e) => AdvertisementData.fromJson(e.data));
  //       debugPrint(value.toMap().toString());

  //       final advertisements = list.map((data) => data.toDomain()).toList();
  //       return Either.right(advertisements);
  //     });
  //   } catch (error) {
  //     return Left(AppException(
  //       message: 'Unknown error occurred while creating card',
  //       statusCode: 499,
  //       title: "Unknown error",
  //       identifier: '${error.toString()}\ncardCreate',
  //     ));
  //   }
  // }

  // @override
  // Future<Either<Exception, List<Directory>>> fetchDirectories(
  //     List<String> tags) async {
  //   try {
  //     return databases.listDocuments(
  //       databaseId: EnvInfo.databaseId,
  //       collectionId: EnvInfo.directoryCollectionId,
  //       queries: [if (tags.isNotEmpty) Query.equal('tag', tags)],
  //     ).then((value) {
  //       final list = value.documents.map((e) => DirectoryData.fromJson(e.data));
  //       debugPrint(value.toMap().toString());

  //       final directories = list.map((data) => data.toDomain()).toList();
  //       return Either.right(directories);
  //     });
  //   } catch (error) {
  //     return Left(AppException(
  //       message: 'Unknown error occurred while creating card',
  //       statusCode: 499,
  //       title: "Unknown error",
  //       identifier: '${error.toString()}\ncardCreate',
  //     ));
  //   }
  // }
}
