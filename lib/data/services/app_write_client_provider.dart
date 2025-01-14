import 'package:appwrite/appwrite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_dashboard/main/appConfig/app_env.dart';

// Define a provider for the Appwrite Client
final clientProvider = Provider<Client>((ref) {
  final client = Client();
  client
      .setEndpoint(EnvInfo.baseURL) // Set the Appwrite endpoint
      .setProject(EnvInfo.projectId); // Set the project ID
  return client;
});

// Define a provider for the Appwrite Client
final databaseProvider = Provider<Databases>((ref) {
  final client = ref.watch(clientProvider);
  final databases = Databases(client);
  return databases;
});

final accountProvider = Provider<Account>((ref) {
  final client = ref.watch(clientProvider);
  final account = Account(client);
  return account;
});

final storageProvider = Provider<Storage>((ref) {
  final client = ref.watch(clientProvider);
  final storage = Storage(client);
  return storage;
});

final teamProvider = Provider<Teams>((ref) {
  final client = ref.watch(clientProvider);
  final team = Teams(client);
  return team;
});

final functionProvider = Provider<Functions>((ref) {
  final client = ref.watch(clientProvider);
  final function = Functions(client);
  return function;
});
