import 'package:hive_flutter/hive_flutter.dart';

import 'hive_boxes.dart';

class HiveService {

  static Future<void> init() async {

    await Hive.initFlutter();

    await Hive.openBox(
      HiveBoxes.requests,
    );

    await Hive.openBox(
      HiveBoxes.approvals,
    );

    await Hive.openBox(
      HiveBoxes.assets,
    );

    await Hive.openBox(
      'user_box',
    );
  }
}