import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pilem_app/model/review_tv_model.dart';
import 'package:pilem_app/res/theme.dart';

import '../../../model/review_movie_model.dart';
import '../../../res/color.dart';
import '../../../res/components/avatar_picture.dart';
import '../../../res/const.dart';
import '../../../res/textstyle.dart';
import '../../../utils/utils.dart';

class CommentTileTv extends StatelessWidget {
  final ReviewTv data;
  const CommentTileTv({
    super.key,
    required this.data,
  });

  String _username() {
    return data.authorDetails!.name.toString() != ""
        ? data.authorDetails!.name.toString()
        : "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AvatarPicture(
              customMargin: EdgeInsets.only(
                top: 18,
              ),
              imgProfile: AppConst.imgAvenger,
              size: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _username(),
                    style: AppStyle.tRegular.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: AppTheme.light,
                    ),
                  ),
                  Text(
                    Utils.timeAgoCustom(
                      DateTime.parse(
                        data.createdAt.toString(),
                      ),
                    ),
                    style: AppStyle.tCommentDate,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          data.content.toString(),
          style: AppStyle.tComment,
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(
          height: 1,
          color: AppColors.whiteColor.withOpacity(0.3),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
