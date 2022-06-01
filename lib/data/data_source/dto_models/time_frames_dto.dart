import 'activity_periods_dto.dart';

class TimeframesDto {
  ActivityPeriodsDto? daily;
  ActivityPeriodsDto? monthly;
  ActivityPeriodsDto? weekly;

  TimeframesDto({this.daily, this.monthly, this.weekly});

  TimeframesDto.fromJson(Map<String, dynamic> json) {
    daily = json['daily'] != null
        ? ActivityPeriodsDto.fromJson(json['daily'])
        : null;
    monthly = json['monthly'] != null
        ? ActivityPeriodsDto.fromJson(json['monthly'])
        : null;
    weekly = json['weekly'] != null
        ? ActivityPeriodsDto.fromJson(json['weekly'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (daily != null) {
      data['daily'] = daily!.toJson();
    }
    if (monthly != null) {
      data['monthly'] = monthly!.toJson();
    }
    if (weekly != null) {
      data['weekly'] = weekly!.toJson();
    }
    return data;
  }
}
