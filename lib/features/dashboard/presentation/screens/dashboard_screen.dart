import 'package:corporate_procurement/core/utils/state_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/notification_service.dart';
import '../../../approvals/presentation/provider/approval_provider.dart';
import '../../../assets/presentation/provider/asset_provider.dart';
import '../../../procurement/presentation/provider/procurement_provider.dart';
import '../provider/dashboard_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
        ),
        centerTitle: true,

        actions: [

          IconButton(
            onPressed: () {
              context.push(
                '/profile',
              );
            },
            icon: const Icon(
              Icons.person,
            ),
          ),

        ],
      ),
      body: _buildBody(context, ref, state),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, dynamic state) {
    if (state.status == StateStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == StateStatus.error) {
      return Center(child: Text(state.error ?? 'Something went wrong'));
    }

    final dashboard = state.dashboard;
    final requests =
    ref.watch(procurementProvider);

    final approvals =
    ref.watch(approvalProvider);

    final assets =
    ref.watch(assetProvider);
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(dashboardProvider.notifier).loadDashboard();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back 👋',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            /// Summary Cards
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.4,
              children: [
                _dashboardCard(
                  title: 'Requests',
                  value:
                  requests.requests.length
                      .toString(),
                  icon: Icons.request_page,
                ),

                _dashboardCard(
                  title: 'Approvals',
                  value:
                  approvals.approvals.length
                      .toString(),
                  icon: Icons.approval,
                ),

                _dashboardCard(
                  title: 'Assets',
                  value:
                    assets.length.toString(),
                  icon: Icons.laptop_mac,
                ),

                _dashboardCard(
                  title: 'Orders',
                  value: '${dashboard?.orders ?? 0}',
                  icon: Icons.shopping_bag,
                ),
              ],
            ),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {

                NotificationService
                    .handleNotification(
                  'request_approved',
                );
              },
              child: const Text(
                'Test Approval Notification',
              ),
            ),
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.6,
              children: [
                _actionCard(
                  title: 'Create Request',
                  icon: Icons.add_box,
                  onTap: () {
                    context.push('/create-request');
                  },
                ),

                _actionCard(
                  title: 'Products',
                  icon: Icons.inventory,
                  onTap: () {
                    context.push('/requests');
                  },
                ),

                _actionCard(
                  title: 'Approvals',
                  icon: Icons.approval,
                  onTap: () {
                    context.push('/approvals');
                  },
                ),


                _actionCard(
                  title: 'Assets',
                  icon: Icons.devices,
                  onTap: () {
                    context.push('/assets');
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Recent Requests',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

            ),

            const SizedBox(height: 12),

            requests.requests.isEmpty
                ? const Center(
              child: Padding(
                padding:
                EdgeInsets.all(20),
                child: Text(
                  'No Requests Found',
                ),
              ),
            )
                : ListView.builder(
              itemCount: requests.requests.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text(
                      requests
                          .requests[index]
                          .productName,
                    ),

                    subtitle: Text(
                      requests
                          .requests[index]
                          .status,
                    ),

                    leading: CircleAvatar(
                      child: Text(
                        '${index + 1}',
                      ),
                    ),

                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),

                    onTap: () {
                      context.push(
                        '/requests',
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget _dashboardCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30),

            const SizedBox(height: 8),

            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            Text(title),
          ],
        ),
      ),
    );
  }

  static Widget _actionCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30),

            const SizedBox(height: 8),

            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
