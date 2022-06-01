import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tracker_demo/persentation/widgets/name_carf_widget.dart';

class MobileHomeScreen extends StatelessWidget {
  final Size size;
  const MobileHomeScreen({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ListView(
          children: [
            NameCardWidget(
              size: size,
            )
          ],
        );
      },
    );
  }
}
