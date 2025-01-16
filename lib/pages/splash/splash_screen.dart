import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_dashboard/domain/model/auth_state.dart';
import 'package:refugee_dashboard/pages/authentication/presenter/page/sign_in_page.dart';
import 'package:refugee_dashboard/pages/entry_point.dart';
import 'package:refugee_dashboard/pages/splash/provider/splah_screen_provider.dart';
import 'package:refugee_dashboard/shared/constants/extensions.dart';
import 'package:refugee_dashboard/theme/app_colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "/";

  @override
  ConsumerState<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Access your provider here
      ref.read(splashScreenViewModelProvider.notifier).initAuthState();
      // Do something with authState
    });
  }

  @override
  Widget build(BuildContext context) {
    // final provider = ref.watch(splashScreenProvider.notifier);
    // final state = ref.watch(splashScreenProvider);
    ref.listen(
      splashScreenViewModelProvider.select((value) => value.authState),
      ((previous, next) {
        if (next is Failure) {
          context.go(SignInPage.routeName);
        } else if (next is Success) {
          context.go(EntryPoint.routeName);
        }
      }),
    );
    return Scaffold(
        backgroundColor: AppColors.bgLight,
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'icons/ic_logo.svg',
              height: 72,
              width: 72,
              colorFilter: AppColors.primary.toColorFilter,
            ),
            Text(
              "Refugee Care",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 28,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700),
            )
          ],
        )));
  }
}
