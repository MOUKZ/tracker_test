import 'package:flutter/material.dart';
import 'package:tracker_demo/persentation/screens/disktop/disktop_hoem_screen.dart';
import 'package:tracker_demo/persentation/screens/mobile/mobile_home_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return DiskTopHomeScreen(
            size: sizingInformation.screenSize,
          );
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return MobileHomeScreen(
            size: sizingInformation.screenSize,
          );
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
          return MobileHomeScreen(
            size: sizingInformation.screenSize,
          );
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return DiskTopHomeScreen(
            size: sizingInformation.screenSize,
          );
        }

        return Container(
          color: Colors.amber,
          height: 300,
        );
      },
    ));
  }
}
