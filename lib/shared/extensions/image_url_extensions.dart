import 'package:refugee_dashboard/main/appConfig/app_env.dart';

String getImageUrl(String fileId) {
  return '${EnvInfo.baseURL}/storage/buckets/${EnvInfo.buckedId}/files/$fileId/view?project=${EnvInfo.projectId}';
}
