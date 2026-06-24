
import '../app/app_router.dart';

class NotificationService {

  static void handleNotification(
      String type,
      ) {

    switch (type) {

      case 'request_created':

        AppRouter.router.go(
          '/requests',
        );

        break;

      case 'request_approved':

        AppRouter.router.go(
          '/approvals',
        );

        break;

      case 'asset_assigned':

        AppRouter.router.go(
          '/assets',
        );

        break;
    }
  }
}