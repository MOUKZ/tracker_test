import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker_demo/constants/app_colors.dart';
import 'package:tracker_demo/data/models/activity/activity.dart';

import '../../data/repository/activity_repository.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final ActivityRepository activityRepository;

  ActivityBloc(this.activityRepository) : super(NoDataState()) {
    on<LoadDataEvent>((event, emit) async {
      bool isDaily = true;
      bool isWeekly = false;
      bool isMonthly = false;

      if (state is DataLoadedState) {
        isDaily = (state as DataLoadedState).isDaily;
        isWeekly = (state as DataLoadedState).isWeekly;
        isMonthly = (state as DataLoadedState).isMonthly;
      }

      BotToast.showLoading();
      final activityList = await activityRepository.getActivities();
      BotToast.closeAllLoading();
      emit(DataLoadedState(
          isDaily: isDaily,
          isWeekly: isWeekly,
          isMonthly: isMonthly,
          activityList: activityList));
    });
    on<DailyEvent>(
      (event, emit) {
        if (state is DataLoadedState) {
          final newState = (state as DataLoadedState)
              .copyWith(daily: true, weekly: false, monthly: false);
          emit(newState);
        } else {
          add(LoadDataEvent());
        }
      },
    );
    on<WeeklyEvent>(
      (event, emit) {
        if (state is DataLoadedState) {
          final newState = (state as DataLoadedState)
              .copyWith(weekly: true, daily: false, monthly: false);
          emit(newState);
        } else {
          add(LoadDataEvent());
        }
      },
    );
    on<MonthlyEvent>(
      (event, emit) {
        if (state is DataLoadedState) {
          final newState = (state as DataLoadedState)
              .copyWith(monthly: true, daily: false, weekly: false);
          emit(newState);
        } else {
          add(LoadDataEvent());
        }
      },
    );
  }
}
