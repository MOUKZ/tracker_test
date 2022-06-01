import 'package:flutter/material.dart';
import 'package:tracker_demo/persentation/widgets/name_carf_widget.dart';

import '../../widgets/activity_card.dart';

class MobileHomeScreen extends StatelessWidget {
  final Size size;
  const MobileHomeScreen({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ListView(
          scrollDirection:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? Axis.vertical
                  : Axis.horizontal,
          children: [
            NameCardWidget(
              size: size,
            ),
            ActivityCard(size: size)
          ],
        );
      },
    );
  }
}
