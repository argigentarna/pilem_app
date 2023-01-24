import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pilem_app/res/color.dart';

class AppbarBackButton extends StatelessWidget {
  final VoidCallback onPress;
  const AppbarBackButton({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
        ),
        child: Center(
          child: IconButton(
            padding: const EdgeInsets.only(left: 5),
            onPressed: onPress,
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteColor.withOpacity(0.3),
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
