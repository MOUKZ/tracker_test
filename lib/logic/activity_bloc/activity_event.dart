part of 'activity_bloc.dart';

abstract class ActivityEvent {}

class LoadDataEvent extends ActivityEvent {}

class DailyEvent extends ActivityEvent {}

class MonthlyEvent extends ActivityEvent {}

class WeeklyEvent extends ActivityEvent {}
