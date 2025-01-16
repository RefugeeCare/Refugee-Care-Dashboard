import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_dashboard/data/services/app_write_client_provider.dart';
import 'package:refugee_dashboard/di/locator.dart';
import 'package:refugee_dashboard/domain/repository/cutomer/customer_data_soucre.dart';
import 'package:refugee_dashboard/domain/repository/cutomer/customer_data_source_impl.dart';
import 'package:refugee_dashboard/shared/storage/hive_helper.dart';

final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  final HiveHelper hiveHelper = locator<HiveHelper>();
  final account = ref.watch(accountProvider);
  final databases = ref.watch(databaseProvider);

  return CustomerRepositoryImpl(account, databases, hiveHelper);
});
