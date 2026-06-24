import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../assets/presentation/provider/asset_provider.dart';
import '../provider/approval_provider.dart';

class PendingApprovalScreen
    extends ConsumerWidget {
  const PendingApprovalScreen({
    super.key,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final state =
    ref.watch(approvalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pending Approvals',
        ),
      ),
      body: ListView.builder(
        itemCount:
        state.approvals.length,
        itemBuilder: (context, index) {

          final approval =
          state.approvals[index];

          return Card(
            margin:
            const EdgeInsets.all(8),
            child: Padding(
              padding:
              const EdgeInsets.all(
                12,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                children: [

                  Text(
                    approval.productName,
                    style:
                    const TextStyle(
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    approval.employeeName,
                  ),

                  Text(
                    approval.status,
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  Row(
                    children: [

                      Expanded(
                        child:
                        ElevatedButton(
                          onPressed: () async {

                            ref
                                .read(
                              approvalProvider.notifier,
                            )
                                .approveRequest(
                              approval.id,
                            );

                            await ref
                                .read(
                              assetProvider.notifier,
                            )
                                .addAsset(
                              name:
                              approval.productName,
                            );
                          },
                          child:
                          const Text(
                            'Approve',
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child:
                        ElevatedButton(
                          onPressed: () {
                            ref
                                .read(
                              approvalProvider
                                  .notifier,
                            )
                                .rejectRequest(
                              approval.id,
                            );
                          },
                          child:
                          const Text(
                            'Reject',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}