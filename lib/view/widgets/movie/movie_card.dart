import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pilem_app/res/app_url.dart';
import 'package:pilem_app/res/textstyle.dart';
import 'package:pilem_app/res/theme.dart';

import '../../../model/movie_model.dart';
import '../../../res/color.dart';
import '../../../res/const.dart';
import '../../../res/components/glass_container.dart';

class MovieCard extends StatelessWidget {
  final VoidCallback onPress;
  final bool? isDetilMovie;
  final MovieItem movieItem;

  const MovieCard({
    super.key,
    required this.movieItem,
    required this.onPress,
    this.isDetilMovie = false,
  });

  double _widthCard() {
    if (isDetilMovie == true) {
      return double.infinity;
    }
    return 200;
  }

  double _heightCard() {
    if (isDetilMovie == true) {
      return 500;
    }
    return 300;
  }

  Widget _description() {
    if (isDetilMovie == true) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            movieItem.voteAverage.toString(),
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
      movieItem.title.toString(),
      style: AppTheme.mainTextStyle.copyWith(
        color: AppColors.whiteColor,
        fontSize: 14,
        fontWeight: AppTheme.light,
      ),
    );
  }

  EdgeInsets _marginGlass() {
    if (isDetilMovie == true) {
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
    if (movieItem.posterPath == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        width: isDetilMovie == true ? null : 200,
        child: Stack(
          alignment:
              isDetilMovie == true ? Alignment.topLeft : Alignment.bottomLeft,
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
                          AppUrl.showImageUrl(movieItem.posterPath.toString()),
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
              customWidth: isDetilMovie == true ? 100 : null,
            ),
          ],
        ),
      ),
    );
  }
}
