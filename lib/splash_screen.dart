import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/storage/session_manager.dart';

class SplashScreen
    extends StatefulWidget {

  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen>
  createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin()
  async {

    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    final isLoggedIn =
    SessionManager
        .isLoggedIn();

    if (!mounted) return;

    if (isLoggedIn) {

      context.go(
        '/dashboard',
      );

    } else {

      context.go(
        '/login',
      );
    }
  }

  @override
  Widget build(
      BuildContext context,
      ) {
    return const Scaffold(
      body: Center(
        child:
        CircularProgressIndicator(),
      ),
    );
  }
}