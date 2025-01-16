import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_dashboard/pages/notification/model/refugee_notification.dart';
import 'package:refugee_dashboard/pages/notification/presenter/list/notification_item.dart';
import 'package:refugee_dashboard/pages/notification/presenter/provider/notification_view_model.dart';
import 'package:refugee_dashboard/shared/constants/defaults.dart';
import 'package:refugee_dashboard/shared/constants/ghaps.dart';
import 'package:refugee_dashboard/shared/widgets/loading/refugee_loading.dart';
import 'package:refugee_dashboard/shared/widgets/section_title.dart';
import 'package:refugee_dashboard/theme/app_colors.dart';

class NotificationListScreen extends HookConsumerWidget {
  final List<String> messageTypes = ['All', 'Member'];

  NotificationListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final title = useTextEditingController();
    final description = useTextEditingController();
    final description2 = useTextEditingController();
    final messageType = useState('');
    final state = ref.watch(notificationViewModelProvider);
    return SingleChildScrollView(
        child: Container(
      decoration: const BoxDecoration(
        color: AppColors.bgSecondayLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppDefaults.borderRadius),
        ),
      ),
      padding: const EdgeInsets.all(AppDefaults.padding * 0.75),
      child: Column(
        children: [
          gapH8,
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            child: SectionTitle(
              title: "Notifications",
              color: AppColors.secondaryLavender,
            ),
          ),
          gapH16,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Title', style: Theme.of(context).textTheme.labelSmall),
                Text('Status', style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
          gapH8,
          const Divider(),
          state.when(
              data: (notifications) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDefaults.padding * 0.5,
                  ),
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: notifications.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return NotificationItem(
                        notification: notifications[index],
                      );
                    },
                  ),
                );
              },
              loading: () => const RefugeeLoading(),
              error: (error, _) => Center(
                    child: Text(error.toString()),
                  )),
          gapH16,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "More notificaitons",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          gapH8,
        ],
      ),
    ));
  }
}
