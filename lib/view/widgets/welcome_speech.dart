import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../res/color.dart';
import '../../res/textstyle.dart';
import '../../res/theme.dart';

class WelcomeSpeech extends StatelessWidget {
  final String title;
  const WelcomeSpeech({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
      ),
      child: Text(
        title,
        style: AppStyle.tWelcomeSpeech,
      ),
    );
  }
}
