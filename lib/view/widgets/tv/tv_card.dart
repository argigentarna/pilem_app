import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pilem_app/res/app_url.dart';
import 'package:pilem_app/res/textstyle.dart';
import 'package:pilem_app/res/theme.dart';

import '../../../model/movie_model.dart';
import '../../../model/tv_model.dart';
import '../../../res/color.dart';
import '../../../res/const.dart';
import '../../../res/components/glass_container.dart';

class TvCard extends StatelessWidget {
  final VoidCallback onPress;
  final bool? isDetilTv;
  final TvItem tvItem;

  const TvCard({
    super.key,
    required this.tvItem,
    required this.onPress,
    this.isDetilTv = false,
  });

  double _widthCard() {
    if (isDetilTv == true) {
      return double.infinity;
    }
    return 200;
  }

  double _heightCard() {
    if (isDetilTv == true) {
      return 500;
    }
    return 300;
  }

  Widget _description() {
    if (isDetilTv == true) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tvItem.voteAverage.toString(),
            style: AppStyle.tRegular,
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.star,
            color: AppColors.primaryColor,
            size: 20,
          )
        ],
      );
    }

    return Text(
      tvItem.name.toString(),
      style: AppTheme.mainTextStyle.copyWith(
        color: AppColors.whiteColor,
        fontSize: 14,
        fontWeight: AppTheme.light,
      ),
    );
  }

  EdgeInsets _marginGlass() {
    if (isDetilTv == true) {
      return const EdgeInsets.only(
        left: 20,
        top: 10,
      );
    }
    return const EdgeInsets.only(
      left: 10,
      right: 10,
      bottom: 10,
    );
  }

  bool imageAvailable() {
    if (tvItem.posterPath == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        width: isDetilTv == true ? null : 200,
        child: Stack(
          alignment:
              isDetilTv == true ? Alignment.topLeft : Alignment.bottomLeft,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5),
              decoration: const BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              width: _widthCard(),
              height: _heightCard(),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: imageAvailable()
                      ? Image.network(
                          AppUrl.showImageUrl(tvItem.posterPath.toString()),
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.image,
                          color: AppColors.primaryColor,
                          size: 90,
                        ),
                ),
              ),
            ),
            GlassContainer(
              description: _description(),
              customMargin: _marginGlass(),
              customWidth: isDetilTv == true ? 100 : null,
            ),
          ],
        ),
      ),
    );
  }
}
