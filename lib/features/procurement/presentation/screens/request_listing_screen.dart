import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../provider/procurement_provider.dart';
import 'create_request_screen.dart';
import 'request_details_screen.dart';

class RequestListScreen extends ConsumerWidget {
  const RequestListScreen({super.key});

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final state = ref.watch(
      procurementProvider,
    );

    return Scaffold(
    appBar: AppBar(
    title: const Text(
    'Purchase Requests',
    ),
    ),

    floatingActionButton:
    FloatingActionButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (_) =>
    const CreateRequestScreen(),
    ),
    );
    },
    child: const Icon(
    Icons.add,
    ),
    ),

    body: state.requests.isEmpty
    ? const Center(
    child: Text(
    'No Requests Found',
    ),
    )
        : ListView.builder(
    itemCount:
    state.requests.length,
    itemBuilder:
    (context, index) {

    final request =
    state.requests[index];

    return Card(
    margin:
    const EdgeInsets
        .all(8),
    child: ListTile(
    title: Text(
    request.productName,
    ),

    subtitle: Column(
    crossAxisAlignment:
    CrossAxisAlignment
        .start,
    children: [
    Text(
    request.category,
    ),

    Text(
    request.status,
    ),
    ],
    ),

    trailing:
    const Icon(
    Icons
        .arrow_forward_ios,
    ),

    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (_) =>
    RequestDetailsScreen(
    request:
    request,
    ),
    ),
    );
    },
    ),
    );
    },
    ),
    );


  }
}
