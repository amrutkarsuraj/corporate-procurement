import 'package:flutter/material.dart';

class AssetDetailsScreen extends StatelessWidget {
  const AssetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Details'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text('Asset ID'),
              subtitle: Text('AS001'),
            ),
            ListTile(
              title: Text('Warranty'),
              subtitle: Text('2 Years'),
            ),
            ListTile(
              title: Text('Status'),
              subtitle: Text('Active'),
            ),
          ],
        ),
      ),
    );
  }
}