import 'activity_periods.dart';

class Timeframes {
  ActivityPeriods? daily;
  ActivityPeriods? monthly;
  ActivityPeriods? weekly;

  Timeframes({this.daily, this.monthly, this.weekly});

  Timeframes.fromJson(Map<String, dynamic> json) {
    daily =
        json['daily'] != null ? ActivityPeriods.fromJson(json['daily']) : null;
    monthly = json['monthly'] != null
        ? ActivityPeriods.fromJson(json['monthly'])
        : null;
    weekly = json['weekly'] != null
        ? ActivityPeriods.fromJson(json['weekly'])
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
