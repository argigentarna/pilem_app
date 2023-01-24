import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../res/color.dart';
import '../../res/textstyle.dart';

class ProfileTile extends StatelessWidget {
  final String? title, description;
  const ProfileTile({
    super.key,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 10,
            ),
            padding: const EdgeInsets.all(
              10,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              border: Border.all(
                color: AppColors.primaryColor,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  50,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toString(),
                  style: AppStyle.tStatusMovie.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    description.toString(),
                    style: AppStyle.tStatusMovie.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
