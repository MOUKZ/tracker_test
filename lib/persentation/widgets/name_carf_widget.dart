import 'package:flutter/material.dart';
import 'package:tracker_demo/constants/app_colors.dart';

class NameCardWidget extends StatelessWidget {
  final Size size;
  const NameCardWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: size.height * 0.3,
      width: size.width * 0.9,
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
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(10),
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
                        height: size.height * .09,
                        width: size.width * .09,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
                children: const [
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
