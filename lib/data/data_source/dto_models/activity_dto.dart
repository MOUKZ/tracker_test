import 'package:tracker_demo/data/data_source/dto_models/time_frames_dto.dart';
import 'package:tracker_demo/data/models/activity/activity.dart';

class ActivityDto {
  TimeframesDto? timeframes;
  String? title;

  ActivityDto({this.timeframes, this.title});

  ActivityDto.fromJson(Map<String, dynamic> json) {
    timeframes = json['timeframes'] != null
        ? TimeframesDto.fromJson(json['timeframes'])
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

  Activity toActivity() {
    return Activity(title: title, timeframes: timeframes?.toTimeframes());
  }
}
