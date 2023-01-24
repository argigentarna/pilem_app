import 'package:flutter/material.dart';
import 'package:pilem_app/res/color.dart';
import 'package:pilem_app/res/textstyle.dart';
import 'package:pilem_app/view/widgets/movie/status_movie.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../model/movie_model.dart';
import '../../res/appbar.dart';
import '../../view_model/auth_view_model.dart';
import '../../view_model/home_view_model.dart';
import '../widgets/movie/movie_card.dart';
import '../widgets/movie/movie_review.dart';

class DetilMovieView extends StatefulWidget {
  final MovieItem item;
  const DetilMovieView({
    super.key,
    required this.item,
  });

  @override
  State<DetilMovieView> createState() => _DetilMovieViewState();
}

class _DetilMovieViewState extends State<DetilMovieView> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.clearDataComment();
    homeViewModel.fetchReviewMovies(widget.item.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.primaryAppbar('Movie Details', () {
        Navigator.pop(context);
      }),
      body: ListView(
        children: [
          buildThumbnail(),
          buildTitle(),
          buildGenres(),
          buildDescription(),
          ChangeNotifierProvider<HomeViewModel>(
            create: (context) => homeViewModel,
            child: Consumer<HomeViewModel>(
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
                    return MovieReview(
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
    return MovieCard(
      movieItem: widget.item,
      isDetilMovie: true,
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
        widget.item.title.toString(),
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
