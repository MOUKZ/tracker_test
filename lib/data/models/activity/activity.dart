import 'package:tracker_demo/data/models/activity/time_frames.dart';

class Activity {
  Timeframes? timeframes;
  String? title;

  Activity({this.timeframes, this.title});

  Activity.fromJson(Map<String, dynamic> json) {
    timeframes = json['timeframes'] != null
        ? Timeframes.fromJson(json['timeframes'])
        : null;
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (timeframes != null) {
      data['timeframes'] = timeframes!.toJson();
    }
    data['title'] = title;
    return data;
  }
}

extension ToActivity on num {
  num plus(num other) => this + other;

  num times(num other) => this * other;
}
