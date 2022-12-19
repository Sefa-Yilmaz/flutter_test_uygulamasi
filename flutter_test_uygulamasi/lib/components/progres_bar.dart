import 'package:flutter/material.dart';
import 'package:flutter_test_uygulamasi/constants.dart';
import 'package:flutter_test_uygulamasi/controllers/quistion_controller.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ProgresBar extends StatelessWidget {
  const ProgresBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(243, 255, 71, 104), width: 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuistionController>(
        init: QuistionController(),
        builder: (controller) {
          // print(controller.animation.value);
          return Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  width: constraints.maxWidth * controller.animation.value,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${(controller.animation.value * 60).round()} sec'),
                      WebsafeSvg.asset('assets/icons/clock.svg')
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
