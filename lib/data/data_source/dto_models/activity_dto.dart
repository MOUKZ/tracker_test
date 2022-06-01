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
}
