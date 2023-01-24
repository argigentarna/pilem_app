import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../color.dart';
import '../theme.dart';

class GlassContainer extends StatelessWidget {
  final Widget description;
  final double? customWidth;
  final EdgeInsets? customMargin;
  const GlassContainer({
    super.key,
    required this.description,
    this.customMargin,
    this.customWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: customWidth,
      margin: customMargin,
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(
          0.1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            50,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 18,
                ),
                child: description,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
