import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/activity_bloc/activity_bloc.dart';
import '../../widgets/activity_card_disktop.dart';
import '../../widgets/name_card_disktop_widget.dart';

class DiskTopHomeScreen extends StatelessWidget {
  DiskTopHomeScreen({Key? key, required this.size}) : super(key: key);
  final Size size;
  final scrollController = ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return BlocBuilder(
          bloc: BlocProvider.of<ActivityBloc>(context),
          builder: (context, state) {
            return ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                  PointerDeviceKind.stylus,
                  PointerDeviceKind.unknown
                },
              ),
              child: Row(
                // controller: scrollController,
                // scrollDirection:
                //     MediaQuery.of(context).orientation == Orientation.portrait
                //         ? Axis.vertical
                //         : Axis.horizontal,
                children: [
                  NameCardDiskTopWidget(
                    size: size,
                    isDay: (state is DataLoadedState) ? state.isDaily : true,
                    isMonth:
                        (state is DataLoadedState) ? state.isMonthly : false,
                    isWeek: (state is DataLoadedState) ? state.isWeekly : false,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      scrollDirection: Axis.horizontal,
                      // controller: scrollController,
                      shrinkWrap: true,
                      itemCount: (state is DataLoadedState)
                          ? state.activityList.length
                          : 0,
                      itemBuilder: (context, index) => ActivityCardDiskTop(
                        size: size,
                        current: (state as DataLoadedState)
                                .getCurrent(index)
                                ?.toString() ??
                            "0",
                        previous: state.getPrevious(index)?.toString() ?? "0",
                        title: state.activityList[index].title.toString(),
                        lastPeriod: state.getLatPeriod().toString(),
                        activityColor: state.getColors(index),
                        image: state.getImage(index),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
