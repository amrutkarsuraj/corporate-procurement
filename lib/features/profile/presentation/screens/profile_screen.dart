import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/storage/session_manager.dart';

import '../../../../core/theme/theme_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    await SessionManager.logout();

    if (context.mounted) {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),

            const SizedBox(height: 20),

            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Employee'),
            ),

            const ListTile(
              leading: Icon(Icons.email),
              title: Text('employee@company.com'),
            ),

            const ListTile(leading: Icon(Icons.badge), title: Text('Employee')),

            const ListTile(
              leading: Icon(Icons.business),
              title: Text('ABC Corporation'),
            ),

            SwitchListTile(
              title: const Text('Dark Mode'),

              value: isDark,

              onChanged: (value) {
                ref
                    .read(
                  themeProvider.notifier,
                )
                    .toggleTheme(
                  value,
                );
                },

              secondary: const Icon(Icons.dark_mode),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _logout(context),
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
