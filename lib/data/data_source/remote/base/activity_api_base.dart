import 'package:tracker_demo/data/models/activity/activity.dart';

abstract class ActivityApiBase {
  Future<List<Activity>> getActivities();
}
