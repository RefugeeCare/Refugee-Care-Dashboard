import 'package:refugee_dashboard/pages/authentication/presenter/page/register_page.dart';
import 'package:refugee_dashboard/pages/authentication/presenter/page/sign_in_page.dart';
import 'package:refugee_dashboard/pages/entry_point.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  initialLocation: SignInPage.routeName,
  routes: [
    GoRoute(
      path: EntryPoint.routeName,
      builder: (context, state) => EntryPoint(),
    ),
    GoRoute(
      path: SignInPage.routeName,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: RegisterPage.routeName,
      builder: (context, state) => const RegisterPage(),
    ),
    // GoRoute(
    //   path: '/entry-point',
    //   builder: (context, state) => const EntryPoint(),
    // ),

    // GoRoute(
    //   path: '/forgot-password',
    //   builder: (context, state) => const ForgotPasswordScreen(),
    // ),
    // GoRoute(
    //   path: '/password-confirmation/:email',
    //   builder: (context, state) {
    //     final email = state.pathParameters['email'];
    //     if (email == null) {
    //       throw Exception('Recipe ID is missing');
    //     }
    //     return PasswordConfirmationForm(email: email);
    //   },
    // ),
    // GoRoute(
    //   path: '/resend-email-verification',
    //   builder: (context, state) => const EmailResendScreen(),
    // ),
    // GoRoute(
    //   path: '/user-confirmation/:email',
    //   builder: (context, state) {
    //     final email = state.pathParameters['email'];
    //     if (email == null) {
    //       throw Exception('Recipe ID is missing');
    //     }
    //     return UserConfirmationForm(email: email);
    //   },
    // ),
    // GoRoute(
    //   path: '/favorite',
    //   builder: (context, state) => const FavoriteScreen(),
    // ),
    // GoRoute(
    //   path: '/recipe/:id',
    //   builder: (context, state) {
    //     final id = state.pathParameters['id'];
    //     if (id == null) {
    //       throw Exception('Recipe ID or Favorite state is missing');
    //     }
    //     return RecipeDetailsScreen(
    //       id: id,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: '/profile',
    //   builder: (context, state) => const ProfileScreen(),
    // ),
    // GoRoute(
    //   path: '/edit-profile',
    //   builder: (context, state) => const EditProfileScreen(),
    // ),
    // GoRoute(
    //   path: '/all-recipes',
    //   builder: (context, state) => const AllRecipesScreen(),
    // ),
    // GoRoute(
    //   path: '/search-recipes',
    //   builder: (context, state) => const SearchScreen(),
    // ),
    // GoRoute(
    //   path: '/notifications',
    //   builder: (context, state) => const NotificationsScreen(),
    // ),
  ],
);
