import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:tracker_demo/data/models/activity/activity.dart';

import '../../exceptions/http_call_exception.dart';
import '../data_source/remote/base/activity_api_base.dart';

class ActivityRepository {
  final ActivityApiBase activityApi;

  ActivityRepository({required this.activityApi});

  Future<List<Activity>> getActivities() async {
    try {
      return await activityApi.getActivities();
    } on HttpCallExcetopn catch (e) {
      log(e.statusCode.toString());
      BotToast.showText(text: e.message);
      return [];
    } catch (e) {
      // everything else
      BotToast.showText(text: e.toString());

      return [];
    }
  }
}
