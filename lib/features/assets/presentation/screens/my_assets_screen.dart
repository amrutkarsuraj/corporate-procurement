import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/asset_provider.dart';

class MyAssetsScreen
    extends ConsumerWidget {
  const MyAssetsScreen({
    super.key,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {

    final assets =
    ref.watch(assetProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Assets',
        ),
      ),
      body: ListView.builder(
        itemCount: assets.length,
        itemBuilder: (context, index) {

          final asset =
          assets[index];

          return Card(
            margin:
            const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(
                Icons.laptop_mac,
              ),
              title: Text(
                asset.name,
              ),
              subtitle: Text(
                asset.status,
              ),
            ),
          );
        },
      ),
    );
  }
}