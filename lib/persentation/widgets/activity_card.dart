import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: size.height * 0.2,
      decoration: const BoxDecoration(
        color: AppColors.workCardPrimary,
        borderRadius: BorderRadius.only(
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
                  transform: Matrix4.translationValues(0.0, -15, 0.0),
                  child: SvgPicture.asset('assets/images/icon-work.svg',
                      height: (size.height * 0.2) * .6),
                ),
              ),
            ),
          ),
          Container(
            height: (size.height * 0.2) * .7,
            decoration: const BoxDecoration(
              color: AppColors.cardSecondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
