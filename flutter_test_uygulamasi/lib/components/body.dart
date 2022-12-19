import 'package:flutter/material.dart';
import 'package:flutter_test_uygulamasi/components/progres_bar.dart';
import 'package:flutter_test_uygulamasi/components/question_card.dart';
import 'package:flutter_test_uygulamasi/constants.dart';
import 'package:flutter_test_uygulamasi/controllers/quistion_controller.dart';
import 'package:flutter_test_uygulamasi/models/Questions.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuistionController _quistionController = Get.put(QuistionController());
    return Stack(
      children: [
        WebsafeSvg.asset('assets/icons/bg.svg', fit: BoxFit.fill, height: 895),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgresBar(),
              ),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          'Quistion ${_quistionController.questionNumber.value}',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                          text: '/${_quistionController.questions.length}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(color: kSecondaryColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _quistionController.pageController,
                  onPageChanged: _quistionController.updateTheQnNum,
                  itemCount: _quistionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _quistionController.questions[index],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
