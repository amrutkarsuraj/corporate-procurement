import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../core/storage/hive_boxes.dart';
import '../../data/model/asset_model.dart';

final assetProvider =
NotifierProvider<AssetNotifier, List<AssetModel>>(
  AssetNotifier.new,
);

class AssetNotifier extends Notifier<List<AssetModel>> {

  @override
  List<AssetModel> build() {

    final box = Hive.box(
      HiveBoxes.assets,
    );

    return box.values.map((e) {

      final data =
      Map<String,dynamic>.from(e);

      return AssetModel(
        id: data['id'],
        name: data['name'],
        status: data['status'],
      );

    }).toList();
  }

  Future<void> addAsset({
    required String name,
  }) async {

    final asset = AssetModel(
      id: DateTime.now()
          .millisecondsSinceEpoch
          .toString(),
      name: name,
      status: 'Assigned',
    );

    final box = Hive.box(
      HiveBoxes.assets,
    );

    await box.add({
      'id': asset.id,
      'name': asset.name,
      'status': asset.status,
    });

    state = [
      ...state,
      asset,
    ];
  }
}