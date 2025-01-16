import 'package:refugee_dashboard/pages/notification/model/refugee_notification.dart';
import 'package:refugee_dashboard/shared/constants/defaults.dart';
import 'package:refugee_dashboard/shared/constants/ghaps.dart';
import 'package:refugee_dashboard/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({
    super.key,
    required this.notification,
    this.onPressed,
  });

  final RefugeeNotification notification;
  final Function()? onPressed;

  @override
  State<NotificationItem> createState() => _PopularProductItemState();
}

class _PopularProductItemState extends State<NotificationItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDefaults.padding * 0.5,
        vertical: AppDefaults.padding * 0.75,
      ),
      child: InkWell(
        onTap: widget.onPressed,
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.notification.title,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: isHovered ? AppColors.primary : null)),
                Text(
                  widget.notification.description,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: isHovered ? AppColors.primary : null),
                ),
                gapH4,
              ],
            )),
            Chip(
              backgroundColor: widget.notification.active
                  ? AppColors.success.withOpacity(0.1)
                  : AppColors.error.withOpacity(0.1),
              side: BorderSide.none,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDefaults.padding * 0.25,
                  vertical: AppDefaults.padding * 0.25),
              label: Text(
                widget.notification.active ? "Active" : "Deactive",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: widget.notification.active
                        ? AppColors.success
                        : AppColors.error),
              ),
            ),
            gapW16,
            IconButton(
              icon: Icon(Icons.edit),
              color: AppColors.success,
              onPressed: () {},
            ),
            gapW8,
            IconButton(
              icon: Icon(Icons.delete),
              color: AppColors.error,
              onPressed: () {},
            ),
            gapW8,
          ],
        ),
      ),
    );
  }
}
