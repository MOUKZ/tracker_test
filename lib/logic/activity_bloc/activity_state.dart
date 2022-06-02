part of 'activity_bloc.dart';

abstract class ActivityState extends Equatable {}

class NoDataState extends ActivityState {
  @override
  List<Object?> get props => [];
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

  DataLoadedState copyWith(
      {bool? daily, bool? weekly, bool? monthly, List<Activity>? list}) {
    return DataLoadedState(
        isDaily: daily ?? isDaily,
        isWeekly: weekly ?? isWeekly,
        isMonthly: monthly ?? isMonthly,
        activityList: list ?? activityList);
  }

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

  Color getColors(int index) {
    final title = activityList[index].title;
    if (title == "Work") return AppColors.workCardPrimary;
    if (title == "Play") return AppColors.playCardPrimary;
    if (title == "Study") return AppColors.stadyCardPrimary;
    if (title == "Exercise") return AppColors.excerciseCardPrimary;
    if (title == "Social") return AppColors.socialCardPrimary;
    return AppColors.selfCareCardPrimary;
  }

  String getImage(int index) {
    final title = activityList[index].title;
    if (title == "Work") return 'icon-work.svg';
    if (title == "Play") return 'icon-play.svg';
    if (title == "Study") return 'icon-study.svg';
    if (title == "Exercise") return 'icon-exercise.svg';
    if (title == "Social") return 'icon-social.svg';
    return 'icon-self-care.svg';
  }

  @override
  List<Object?> get props => [isDaily, isMonthly, isWeekly, activityList];
}
