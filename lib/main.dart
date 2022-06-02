import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker_demo/constants/app_colors.dart';
import 'package:tracker_demo/persentation/pages/home_page.dart';

import 'data/data_source/remote/impl/activity_api_impl.dart';
import 'data/repository/activity_repository.dart';
import 'logic/activity_bloc/activity_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ActivityRepository>(
            create: (context) =>
                ActivityRepository(activityApi: ActivityApiImpl())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ActivityBloc>(
            create: (BuildContext context) =>
                ActivityBloc(RepositoryProvider.of<ActivityRepository>(context))
                  ..add(LoadDataEvent()),
          )
        ],
        child: MaterialApp(
          builder: BotToastInit(), //1. call BotToastInit
          navigatorObservers: [BotToastNavigatorObserver()],
          title: 'Activity Tracker',
          theme: ThemeData(
              fontFamily: 'IBMPlexSans',
              textTheme: const TextTheme(
                  // bodyText1: TextStyle(fontSize: 30.0),
                  bodyMedium:
                      TextStyle(fontSize: 18, color: AppColors.unSelectedText)),
              primarySwatch: Colors.blue,
              canvasColor: AppColors.backGroundColor),
          home: const HomePage(),
        ),
      ),
    );
  }
}
