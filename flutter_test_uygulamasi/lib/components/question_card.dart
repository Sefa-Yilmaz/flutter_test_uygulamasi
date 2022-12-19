import 'package:flutter/material.dart';
import 'package:flutter_test_uygulamasi/components/body.dart';
import 'package:flutter_test_uygulamasi/components/option.dart';
import 'package:flutter_test_uygulamasi/constants.dart';
import 'package:flutter_test_uygulamasi/controllers/quistion_controller.dart';
import 'package:flutter_test_uygulamasi/models/Questions.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  const QuestionCard({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuistionController _controller = Get.put(QuistionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kBlackColor),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
              text: question.options[index],
              index: index,
              press: () =>_controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
