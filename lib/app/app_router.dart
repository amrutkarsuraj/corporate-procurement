import 'package:corporate_procurement/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../features/procurement/presentation/screens/request_listing_screen.dart';
import '../features/procurement/presentation/screens/create_request_screen.dart';
import '../features/approvals/presentation/screens/pending_approval_screen.dart';
import '../features/assets/presentation/screens/my_assets_screen.dart';
import '../features/assets/presentation/screens/asset_details_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../services/navigation_service.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),

      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),

      GoRoute(
        path: '/requests',
        builder: (context, state) => const RequestListScreen(),
      ),

      GoRoute(
        path: '/create-request',
        builder: (context, state) => const CreateRequestScreen(),
      ),

      GoRoute(
        path: '/approvals',
        builder: (context, state) => const PendingApprovalScreen(),
      ),

      GoRoute(
        path: '/assets',
        builder: (context, state) => const MyAssetsScreen(),
      ),

      GoRoute(
        path: '/asset-details',
        builder: (context, state) => const AssetDetailsScreen(),
      ),

      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/notification-request',
        builder: (context, state) => const RequestListScreen(),
      ),

      GoRoute(
        path: '/notification-approval',
        builder: (context, state) => const PendingApprovalScreen(),
      ),

      GoRoute(
        path: '/notification-asset',
        builder: (context, state) => const MyAssetsScreen(),
      ),
    ],
  );
}
