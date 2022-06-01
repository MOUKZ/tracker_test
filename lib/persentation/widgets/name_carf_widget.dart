import 'package:flutter/material.dart';
import 'package:tracker_demo/constants/app_colors.dart';

class NameCardWidget extends StatelessWidget {
  const NameCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 200,
      decoration: const BoxDecoration(
        color: AppColors.cardSecondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              // height: 150,
              decoration: const BoxDecoration(
                color: AppColors.nameCardPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        "assets/images/image-jeremy.png",
                        height: 80.0,
                        width: 80.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Report for",
                          style: TextStyle(color: AppColors.unSelectedText),
                        ),
                        Text(
                          "Jeremy Robson",
                          style: TextStyle(color: AppColors.selectedText),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Daily',
                    style: TextStyle(color: AppColors.unSelectedText),
                  ),
                  Text(
                    'Weekly',
                    style: TextStyle(color: AppColors.selectedText),
                  ),
                  Text(
                    'Monthly',
                    style: TextStyle(color: AppColors.unSelectedText),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
