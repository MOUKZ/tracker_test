import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';

class ActivityCardDiskTop extends StatelessWidget {
  const ActivityCardDiskTop({
    Key? key,
    required this.size,
    required this.title,
    required this.current,
    required this.previous,
    required this.lastPeriod,
    required this.activityColor,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String title;
  final String current;
  final String previous;
  final String lastPeriod;
  final Color activityColor;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: size.height * 0.3,
      width: size.width * 0.2,
      decoration: BoxDecoration(
        color: activityColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        // clipBehavior: Clip.,
        fit: StackFit.loose,
        children: [
          Container(
            // transform: Matrix4.translationValues(0.0, -15, 0.0),
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                child: Transform(
                  transform: Matrix4.translationValues(0.0, -10, 0.0),
                  child: SvgPicture.asset(
                    'assets/images/$image',
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? (size.height * 0.2) * .6
                        : size.height * 0.3,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? (size.height * 0.2) * .7
                : size.height * 0.3,
            decoration: const BoxDecoration(
              color: AppColors.cardSecondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title),
                    SvgPicture.asset('assets/images/icon-ellipsis.svg')
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$current hrs'),
                    Text('Last $lastPeriod - ${previous}hrs'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
