import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_dashboard/shared/navigation/routes.dart';
import 'package:refugee_dashboard/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light(context),
      routerConfig: routerConfig,
    );
  }
}
