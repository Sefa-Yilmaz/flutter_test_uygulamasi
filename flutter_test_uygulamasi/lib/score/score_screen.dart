import 'package:flutter/material.dart';
import 'package:flutter_test_uygulamasi/constants.dart';
import 'package:flutter_test_uygulamasi/controllers/quistion_controller.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuistionController _qnController = Get.put(QuistionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset('assets/icons/bg.svg',
              fit: BoxFit.fill, height: 895),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                'Score',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                '${_qnController.correctAns * 10}/${_qnController.questions.length * 10}',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
