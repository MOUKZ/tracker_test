import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker_demo/logic/activity_bloc/activity_bloc.dart';
import 'package:tracker_demo/persentation/widgets/name_carf_widget.dart';

import '../../widgets/activity_card.dart';

class MobileHomeScreen extends StatelessWidget {
  final Size size;
  MobileHomeScreen({Key? key, required this.size}) : super(key: key);
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return BlocBuilder(
          bloc: BlocProvider.of<ActivityBloc>(context),
          builder: (context, state) {
            return ListView(
              controller: scrollController,
              scrollDirection:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? Axis.vertical
                      : Axis.horizontal,
              children: [
                NameCardWidget(
                  size: size,
                ),
                ListView.builder(
                  scrollDirection:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? Axis.vertical
                          : Axis.horizontal,
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: (state is DataLoadedState)
                      ? state.activityList.length
                      : 0,
                  itemBuilder: (context, index) => ActivityCard(
                    size: size,
                    current:
                        (state as DataLoadedState).getCurrent(index).toString(),
                    previous: state.getPrevious(index).toString(),
                    title: state.activityList[index].title.toString(),
                    lastPeriod: state.getLatPeriod().toString(),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
