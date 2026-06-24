import 'package:corporate_procurement/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets(
    'Login screen renders',
        (tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      expect(
        find.text('Login'),
        findsOneWidget,
      );
    },
  );
}