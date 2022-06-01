class ActivityPeriods {
  int? current;
  int? previous;

  ActivityPeriods({this.current, this.previous});

  ActivityPeriods.fromJson(Map<String, dynamic> json) {
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
