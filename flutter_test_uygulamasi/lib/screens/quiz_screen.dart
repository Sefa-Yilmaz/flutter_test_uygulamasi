import 'package:flutter/material.dart';
import 'package:flutter_test_uygulamasi/components/body.dart';
import 'package:flutter_test_uygulamasi/controllers/quistion_controller.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuistionController _controller = Get.put(QuistionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _controller.nextQuestion,
            child: const Text('Skip'),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
