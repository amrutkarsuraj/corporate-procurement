import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../approvals/presentation/provider/approval_provider.dart';
import '../../data/models/request_model.dart';
import '../provider/procurement_provider.dart';

class CreateRequestScreen
    extends ConsumerStatefulWidget {
  const CreateRequestScreen({super.key});

  @override
  ConsumerState<CreateRequestScreen>
  createState() =>
      _CreateRequestScreenState();
}

class _CreateRequestScreenState
    extends ConsumerState<CreateRequestScreen> {

  final productController =
  TextEditingController();

  final categoryController =
  TextEditingController();

  final quantityController =
  TextEditingController();

  final justificationController =
  TextEditingController();

  String priority = 'Medium';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Request',
        ),
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(16),
        child: Column(
          children: [

          TextField(
          controller:
          productController,
          decoration:
          const InputDecoration(
            labelText:
            'Product Name',
          ),
        ),

        const SizedBox(height: 16),

        TextField(
          controller:
          categoryController,
          decoration:
          const InputDecoration(
            labelText:
            'Category',
          ),
        ),

        const SizedBox(height: 16),

        TextField(
          controller:
          quantityController,
          keyboardType:
          TextInputType.number,
          decoration:
          const InputDecoration(
            labelText:
            'Quantity',
          ),
        ),

        const SizedBox(height: 16),

        DropdownButtonFormField(
          value: priority,
          items: const [
            DropdownMenuItem(
              value: 'Low',
              child: Text('Low'),
            ),
            DropdownMenuItem(
              value: 'Medium',
              child: Text('Medium'),
            ),
            DropdownMenuItem(
              value: 'High',
              child: Text('High'),
            ),
          ],
          onChanged: (value) {
            priority = value!;
          },
        ),

        const SizedBox(height: 16),

        TextField(
          controller:
          justificationController,
          maxLines: 3,
          decoration:
          const InputDecoration(
            labelText:
            'Justification',
          ),
        ),

        const Spacer(),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {

              final request = RequestModel(
                id: DateTime.now()
                    .millisecondsSinceEpoch
                    .toString(),
                productName:
                productController.text,
                category:
                categoryController.text,
                quantity: int.parse(
                  quantityController.text,
                ),
                priority: priority,
                status: 'Pending',
                justification:
                justificationController.text,
              );

              await ref
                  .read(
                procurementProvider.notifier,
              )
                  .createRequest(request);

              ref
                  .read(
                approvalProvider.notifier,
              )
                  .addApproval(request);

              if (mounted) {
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Submit Request',
            ),
          ),
        ),
        ],
      ),
    ),
    );

  }
}
