import 'package:flutter/material.dart';
import 'package:pilem_app/model/tv_model.dart';
import 'package:pilem_app/res/color.dart';
import 'package:pilem_app/res/textstyle.dart';
import 'package:pilem_app/view/widgets/movie/status_movie.dart';
import 'package:pilem_app/view/widgets/tv/tv_card.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../res/appbar.dart';
import '../../view_model/auth_view_model.dart';
import '../../view_model/tv_view_model.dart';
import '../widgets/tv/tv_review.dart';

class DetilTvView extends StatefulWidget {
  final TvItem item;
  const DetilTvView({
    super.key,
    required this.item,
  });

  @override
  State<DetilTvView> createState() => _DetilTvViewState();
}

class _DetilTvViewState extends State<DetilTvView> {
  TvViewModel tvViewModel = TvViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tvViewModel.clearDataComment();
    tvViewModel.fetchReviewTv(widget.item.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.primaryAppbar('TV Details', () {
        Navigator.pop(context);
      }),
      body: ListView(
        children: [
          buildThumbnail(),
          buildTitle(),
          buildGenres(),
          buildDescription(),
          ChangeNotifierProvider<TvViewModel>(
            create: (context) => tvViewModel,
            child: Consumer<TvViewModel>(
              builder: (context, value, child) {
                switch (value.reviewList.status!) {
                  case Status.loading:
                    return Column(
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    );
                  case Status.error:
                    return Text(value.reviewList.message.toString());
                  case Status.completed:
                    return TvReview(
                      model: value.reviewList,
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildThumbnail() {
    return TvCard(
      tvItem: widget.item,
      isDetilTv: true,
      onPress: () {},
    );
  }

  Widget buildTitle() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      child: Text(
        widget.item.name.toString(),
        style: AppStyle.tTitleMovie,
      ),
    );
  }

  Widget buildGenres() {
    if (widget.item.genreIds == null ||
        widget.item.genreIds.toString() == "[]") {
      return Container();
    }
    return Consumer<AuthViewModel>(
      builder: (_, provider, ch) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          child: Row(
              children: provider
                  .listOfGenre(widget.item.genreIds!.toList())
                  .map((genre) {
            return StatusMovie(
              title: genre.toString(),
              isMiniSize: true,
            );
          }).toList()),
        ),
      ),
    );
  }

  Widget buildDescription() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      child: Text(
        widget.item.overview.toString(),
        style: AppStyle.tRegular.copyWith(
          color: AppColors.whiteColor.withOpacity(
            0.5,
          ),
        ),
      ),
    );
  }
}
