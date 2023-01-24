import 'package:flutter/material.dart';
import 'package:pilem_app/res/textstyle.dart';
import 'package:provider/provider.dart';
import '../../../data/response/api_response.dart';
import '../../../model/review_movie_model.dart';
import '../../../res/color.dart';
import '../../../view_model/home_view_model.dart';
import 'comment_tile.dart';

class MovieReview extends StatefulWidget {
  final ApiResponse<ReviewMovie>? model;
  const MovieReview({super.key, this.model});

  @override
  State<MovieReview> createState() => _MovieReviewState();
}

class _MovieReviewState extends State<MovieReview> {
  @override
  Widget build(BuildContext context) {
    if (widget.model == null) {
      return Container();
    } else {
      return
          // Note : Jika tidak ada data komentar, maka tampilan review kosong
          Container(
        decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 18,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(),
            buildComments(),
          ],
        ),
      );
    }
  }

  Widget buildTitle() {
    return Container(
      margin: const EdgeInsets.only(
        left: 18,
        top: 18,
      ),
      child: Text(
        "Comment (${widget.model?.data?.totalResults ?? 0})",
        style: AppStyle.tRegular,
      ),
    );
  }

  Widget buildComments() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
          children: widget.model!.data!.reviews!.map((comment) {
        return CommentTile(
          data: comment,
        );
      }).toList()),
    );
  }
}
