import 'package:flutter/material.dart';

import '../../data/models/request_model.dart';

class RequestDetailsScreen extends StatelessWidget {
  final RequestModel request;

  const RequestDetailsScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Request Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _item('Request ID', request.id),

                _item('Product', request.productName),

                _item('Category', request.category),

                _item('Quantity', request.quantity.toString()),

                _item('Priority', request.priority),

                _item('Status', request.status),

                _item('Justification', request.justification),

                const SizedBox(height: 20),

                const Text(
                  'Approval Workflow',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Employee'),
                  subtitle: Text('Submitted'),
                ),

                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Manager'),
                  subtitle: Text('Pending'),
                ),

                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Finance'),
                  subtitle: Text('Waiting'),
                ),

                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Procurement'),
                  subtitle: Text('Waiting'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _item(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value),
        ],
      ),
    );
  }
}
