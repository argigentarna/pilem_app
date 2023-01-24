import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../res/color.dart';
import '../../../res/textstyle.dart';

class StatusMovie extends StatelessWidget {
  final bool? isSelected, isMiniSize;
  final String title;
  final VoidCallback? onPress;

  const StatusMovie({
    super.key,
    this.isSelected,
    this.isMiniSize,
    this.onPress,
    required this.title,
  });

  bool _isSelected() {
    if (isSelected != null) {
      return isSelected!;
    }
    return false;
  }

  Color _colorSelected(
    bool isBorder,
  ) {
    if (_isSelected()) {
      return AppColors.primaryColor;
    }
    if (isBorder) {
      return AppColors.blackColor;
    }
    if (isMiniSize == true) {
      return AppColors.whiteColor.withOpacity(0.5);
    }
    return AppColors.whiteColor;
  }

  double _textSize() {
    if (isMiniSize == true) {
      return 12.0;
    }
    return 14.0;
  }

  EdgeInsets _paddingTile() {
    if (isMiniSize == true) {
      return const EdgeInsets.all(
        10,
      );
    }
    return const EdgeInsets.all(20);
  }

  EdgeInsets _marginTile() {
    if (isMiniSize == true) {
      return const EdgeInsets.all(0);
    }
    return const EdgeInsets.only(left: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _marginTile(),
      child: Row(
        children: [
          GestureDetector(
            onTap: onPress,
            child: Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              padding: _paddingTile(),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                border: Border.all(
                  color: _colorSelected(true),
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    50,
                  ),
                ),
              ),
              child: Text(
                title,
                style: AppStyle.tStatusMovie.copyWith(
                  color: _colorSelected(false),
                  fontSize: _textSize(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
