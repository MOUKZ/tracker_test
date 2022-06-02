import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';

class ActivityCard extends StatefulWidget {
  const ActivityCard({
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
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: widget.size.height * 0.2,
      width: widget.size.width * 0.9,
      decoration: BoxDecoration(
        color: widget.activityColor,
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
                    'assets/images/${widget.image}',
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? (widget.size.height * 0.2) * .6
                        : widget.size.height * 0.4,
                  ),
                ),
              ),
            ),
          ),
          MouseRegion(
            // cursor: SystemMouseCursors.zoomIn,
            onEnter: (k) {
              setState(() {
                hover = true;
              });
            },
            onExit: (k) {
              setState(() {
                hover = false;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? (widget.size.height * 0.2) * .7
                  : widget.size.height * 0.7,
              decoration: BoxDecoration(
                color: hover
                    ? AppColors.cardSecondaryHover
                    : AppColors.cardSecondary,
                borderRadius: const BorderRadius.only(
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
                      Text(widget.title),
                      SvgPicture.asset('assets/images/icon-ellipsis.svg')
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${widget.current} hrs'),
                      Text('Last ${widget.lastPeriod} - ${widget.previous}hrs'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
