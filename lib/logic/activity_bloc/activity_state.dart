part of 'activity_bloc.dart';

abstract class ActivityState extends Equatable {}

class NoDataState extends ActivityState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class DataLoadedState extends ActivityState {
  final bool isDaily;
  final bool isWeekly;
  final bool isMonthly;
  final List<Activity> activityList;

  DataLoadedState(
      {required this.isDaily,
      required this.isWeekly,
      required this.isMonthly,
      required this.activityList});

  int? getCurrent(int index) {
    if (isDaily) return activityList[index].timeframes?.daily?.current;
    if (isWeekly) return activityList[index].timeframes?.weekly?.current;
    if (isMonthly) return activityList[index].timeframes?.monthly?.current;
    return null;
  }

  int? getPrevious(int index) {
    if (isDaily) return activityList[index].timeframes?.daily?.previous;
    if (isWeekly) return activityList[index].timeframes?.weekly?.previous;
    if (isMonthly) return activityList[index].timeframes?.monthly?.previous;
    return null;
  }

  String? getLatPeriod() {
    if (isDaily) return "Daily";
    if (isWeekly) return "Weekly";
    if (isMonthly) return "Monthly";
    return null;
  }

  @override
  List<Object?> get props => [isDaily, isMonthly, isWeekly, activityList];
}
