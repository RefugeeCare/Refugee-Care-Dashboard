// ignore: prefer_function_declarations_over_variables
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_dashboard/data/services/app_write_client_provider.dart';
import 'package:refugee_dashboard/data/services/http_network_service_provider.dart';
import 'package:refugee_dashboard/data/services/network_services.dart';
import 'package:refugee_dashboard/di/locator.dart';
import 'package:refugee_dashboard/pages/authentication/data/auth_repository.dart';
import 'package:refugee_dashboard/shared/storage/hive_helper.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final HiveHelper hiveHelper = locator<HiveHelper>();
  final account = ref.watch(accountProvider);
  //  ref.watch(hiveHelperProvider.future);
  return AuthRepositoryImpl(networkService, hiveHelper, account);
});
