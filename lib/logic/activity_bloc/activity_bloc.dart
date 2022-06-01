import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/activity_repository.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final ActivityRepository activityRepository;

  ActivityBloc(this.activityRepository) : super(ActivityInitial()) {
    on<ActivityEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
