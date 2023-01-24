import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../model/movie_model.dart';
import '../../res/enum/movie_status.dart';
import '../../view_model/home_view_model.dart';
import '../widgets/loading_more.dart';
import '../widgets/movie/movie_card.dart';
import '../widgets/movie/status_movie.dart';
import '../widgets/welcome_speech.dart';
import 'detil_movie_view.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  HomeViewModel homeViewModel = HomeViewModel();
  ScrollController controllerScroll = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.changeStatusSelected(MovieStatus.nowPlaying);
    homeViewModel.fetchMovies();

    controllerScroll.addListener(() async {
      if (controllerScroll.position.pixels ==
          controllerScroll.position.maxScrollExtent) {
        homeViewModel.fetchMovies();
      }
    });
  }

  void changeStatusMovie(MovieStatus val) async {
    await homeViewModel.changeStatusSelected(val);
    homeViewModel.fetchMovies();
    setState(() {});
  }

  void navToDetilMovie(MovieItem item) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetilMovieView(
          item: item,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 30,
        ),
        const WelcomeSpeech(
          title: 'Unlimited movies, TV shows, and more',
        ),
        buildStatus(),
        const SizedBox(
          height: 20,
        ),
        buildMoviesByStatus(),
      ],
    );
  }

  Widget buildStatus() {
    bool isSelected(MovieStatus val) {
      return homeViewModel.movieStatusSelected == val;
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.only(right: 30),
        child: Row(
          children: [
            StatusMovie(
              title: 'Now Playing',
              isSelected: isSelected(MovieStatus.nowPlaying),
              onPress: () {
                changeStatusMovie(MovieStatus.nowPlaying);
              },
            ),
            StatusMovie(
              title: 'Upcoming',
              isSelected: isSelected(MovieStatus.upcoming),
              onPress: () {
                changeStatusMovie(MovieStatus.upcoming);
              },
            ),
            StatusMovie(
              title: 'Popular',
              isSelected: isSelected(MovieStatus.popular),
              onPress: () {
                changeStatusMovie(MovieStatus.popular);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMoviesByStatus() {
    return SingleChildScrollView(
      controller: controllerScroll,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.only(
          left: 18,
        ),
        child: ChangeNotifierProvider<HomeViewModel>(
          create: (context) => homeViewModel,
          child: Consumer<HomeViewModel>(
            builder: (context, value, child) {
              switch (value.moviesList.status!) {
                case Status.loading:
                  return const CircularProgressIndicator();
                case Status.error:
                  return Text(value.moviesList.message.toString());
                case Status.completed:
                  return Row(
                    children: value.moviesList.data!.results!.map((movie) {
                      var i = value.moviesList.data!.results!.indexOf(movie);

                      return Row(
                        children: [
                          MovieCard(
                            movieItem: movie,
                            onPress: () {
                              navToDetilMovie(movie);
                            },
                          ),
                          LoadingMore(isLoading: value.isLoadingMore(i))
                        ],
                      );
                    }).toList(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
