import 'package:tracker_demo/data/data_source/dto_models/time_frames_dto.dart';

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
}

extension ToActivity on num {
  num plus(num other) => this + other;

  num times(num other) => this * other;
}
