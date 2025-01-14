import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_dashboard/data/services/app_write_client_provider.dart';
import 'package:refugee_dashboard/shared/constants/defaults.dart';
import 'package:refugee_dashboard/shared/constants/ghaps.dart';
import 'package:refugee_dashboard/shared/widgets/button/refugee_outline_button.dart';
import 'package:refugee_dashboard/shared/widgets/formfield/refugee_form_feild.dart';
import 'package:refugee_dashboard/shared/widgets/section_title.dart';
import 'package:refugee_dashboard/theme/app_colors.dart';

class NotificationCreateScreen extends HookConsumerWidget {
  final List<String> messageTypes = ['All', 'Member'];

  NotificationCreateScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final title = useState('');
    final description = useState('');
    final description2 = useState('');
    final messageType = useState('');

    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.bgSecondayLight,
          borderRadius: BorderRadius.all(
            Radius.circular(AppDefaults.borderRadius),
          ),
        ),
        padding: const EdgeInsets.all(AppDefaults.padding * 0.75),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDefaults.padding * 0.5,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                gapH8,
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDefaults.padding * 0.5,
                  ),
                  child: SectionTitle(
                    title: "Create Notification",
                    color: AppColors.secondaryPaleYellow,
                  ),
                ),
                gapH24,
                RefugeeFormFeild(
                  title: 'Notification title',
                  decoration: const InputDecoration(
                    hintText: 'Enter a title',
                  ),

                  // value: provider.state.message,
                  onChanged: (value) {
                    // provider.updateMessage(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    title.value = value!;
                  },
                ),
                gapH16,
                RefugeeFormFeild(
                  title: 'Notification description',
                  maxLines: 10,
                  decoration:
                      const InputDecoration(hintText: 'Enter a description'),

                  // value: provider.state.message,
                  onChanged: (value) {
                    // provider.updateMessage(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    description.value = value!;
                  },
                ),
                gapH16,
                RefugeeFormFeild(
                  title: 'Notification Description 2 (Optional)',
                  decoration: const InputDecoration(
                    hintText: 'Description 2 (Optional)',
                  ),
                  maxLines: 5,
                  // value: provider.state.message,
                  onChanged: (value) {
                    // provider.updateMessage(value);
                  },
                  onSaved: (value) {
                    description2.value = value!;
                  },
                ),
                gapH16,
                SizedBox(
                    height: 60,
                    child: ListView.builder(
                      itemCount: messageTypes.length,
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      itemBuilder: (context, index) {
                        final item = messageTypes[index];
                        return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: RefugeeTextButton(
                                title: item,
                                onTap: () {
                                  messageType.value = item;
                                  // provider.updateSelectedNumber(index);
                                },
                                isSelected: item == messageType.value
                                //  provider.state.selectedIndex == (index),
                                ));
                      },
                    )),
                gapH16,
                ElevatedButton(
                  onPressed: messageType.value.isEmpty
                      ? null
                      : () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            final response = await ref
                                .watch(functionProvider)
                                .createExecution(
                                    functionId: '677ffbf9000f8d9b7a1a',
                                    path: 'sendPushByTopic',
                                    body: """
                                      {
                                          "topic": "ACRAdminTopic",
                                          "message": {
                                              "title": "$title",
                                              "body": "$description"
                                          },
                                          "data": {
                                              "type": "message" 
                                          }    
                                      }""").then((value) {
                              debugPrint(value.toString());
                            }).onError((error, stack) {
                              debugPrint("error:${error.toString()}");
                              debugPrint("stack:${stack.toString()}");
                            });
                          }
                        },
                  child: Text('Create Notification'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
