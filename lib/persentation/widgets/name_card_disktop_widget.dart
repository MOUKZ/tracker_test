import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker_demo/constants/app_colors.dart';
import 'package:tracker_demo/logic/activity_bloc/activity_bloc.dart';

class NameCardDiskTopWidget extends StatelessWidget {
  final Size size;
  const NameCardDiskTopWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(20),
      height: size.height * 0.9,
      width: size.width * 0.3,
      decoration: const BoxDecoration(
        color: AppColors.cardSecondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(20),
              // height: 150,
              decoration: const BoxDecoration(
                color: AppColors.nameCardPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(100),

                          color: Colors.white,
                        ),
                        child: Image.asset(
                          "assets/images/image-jeremy.png",
                          // height: size.height * .1,
                          // width: size.width * .1,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * .06,
                        ),
                        const Text(
                          "Report for",
                          style: TextStyle(color: AppColors.unSelectedText),
                        ),
                        const Text(
                          "Jeremy\nRobson",
                          style: TextStyle(
                              color: AppColors.selectedText, fontSize: 30),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<ActivityBloc>(context)
                            .add(DailyEvent());
                      },
                      child: const Text(
                        'Daily',
                        style: TextStyle(color: AppColors.unSelectedText),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<ActivityBloc>(context)
                            .add(WeeklyEvent());
                      },
                      child: const Text(
                        'Weekly',
                        style: TextStyle(color: AppColors.selectedText),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<ActivityBloc>(context)
                            .add(MonthlyEvent());
                      },
                      child: const Text(
                        'Monthly',
                        style: TextStyle(color: AppColors.unSelectedText),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
