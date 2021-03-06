import 'package:tracker_demo/data/models/activity/activity_periods.dart';

class ActivityPeriodsDto {
  int? current;
  int? previous;

  ActivityPeriodsDto({this.current, this.previous});

  ActivityPeriodsDto.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    previous = json['previous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['current'] = current;
    data['previous'] = previous;
    return data;
  }

  ActivityPeriods toActivityPeriods() {
    return ActivityPeriods(current: current, previous: previous);
  }
}
