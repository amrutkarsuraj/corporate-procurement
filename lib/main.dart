import 'package:corporate_procurement/app/app.dart';
import 'package:corporate_procurement/services/notification_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/storage/hive_service.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();

  await HiveService.init();

  runApp(
    const ProviderScope(
      child: ProcurementApp(),
    ),
  );
}
