import 'package:corporate_procurement/services/biometric_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/state_status.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_textfield.dart';

import '../provider/auth_provider.dart';
import '../provider/auth_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends ConsumerState<LoginScreen> {

  final emailController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  Future<void> biometricLogin() async {

    final success =
    await BiometricService
        .authenticate();

    if (!mounted) return;

    if (success) {
      context.go('/dashboard');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Biometric Authentication Failed',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);

    ref.listen<AuthState>(
      authProvider,
          (previous, next) {
        if (next.status ==
            StateStatus.success) {
          context.go('/dashboard');
        }

        if (next.status ==
            StateStatus.error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(
            SnackBar(
              content: Text(
                next.errorMessage ??
                    'Login Failed',
              ),
            ),
          );
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.all(20),
          child: Column(
            children: [
              const Spacer(),

              const Text(
                "Corporate Procurement",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              AppTextField(
                controller:
                emailController,
                hintText:
                "Username",
              ),

              const SizedBox(
                height: 15,
              ),

              AppTextField(
                controller:
                passwordController,
                hintText:
                "Password",
                obscureText: true,
              ),

              const SizedBox(
                height: 20,
              ),

              AppButton(
                title:
                state.status ==
                    StateStatus.loading
                    ? "Loading..."
                    : "Login",
                onPressed: () {
                  ref
                      .read(
                    authProvider.notifier,
                  )
                      .login(
                    username:
                    emailController.text,
                    password:
                    passwordController.text,
                  );
                },
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: biometricLogin,
                  icon: const Icon(
                    Icons.fingerprint,
                  ),
                  label: const Text(
                    'Biometric Login',
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}