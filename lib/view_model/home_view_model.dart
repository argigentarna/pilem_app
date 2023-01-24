// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_null_comparison, prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:pilem_app/data/response/status.dart';

import '../data/response/api_response.dart';
import '../model/movie_model.dart';
import '../model/review_movie_model.dart';
import '../repository/home_repository.dart';
import '../res/enum/movie_status.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  // Note : untuk pagination list movie pada halaman home
  int? _pagin = 1;
  int? get pagin => _pagin;

  // Note : untuk pagination list review didetil movie pada halaman home
  int? _paginReview = 1;
  int? get paginReview => _paginReview;

  int get countMovie {
    return moviesList != null ? moviesList.data!.results!.length : 0;
  }

  // Note : current page status movie dihalaman home (ex: now playing, upcoming, popular)
  MovieStatus _movieStatusSelected = MovieStatus.nowPlaying;
  MovieStatus get movieStatusSelected => _movieStatusSelected;

  ApiResponse<Movie> moviesList = ApiResponse.loading();
  ApiResponse<ReviewMovie> reviewList = ApiResponse.loading();

  set pagin(int? pagin) {
    _pagin = pagin;
    notifyListeners();
  }

  set paginReview(int? pagin) {
    _paginReview = pagin;
    notifyListeners();
  }

  Future<void> changeStatusSelected(MovieStatus val) async {
    await clearData();
    _movieStatusSelected = val;
    notifyListeners();
  }

  bool isLoadingMore(int i) {
    return (i + 1) == countMovie;
  }

  Future<void> clearData() async {
    pagin = 1;
    moviesList.data = null;
    moviesList = ApiResponse.loading();
    notifyListeners();
  }

  Future<void> clearDataComment() async {
    paginReview = 1;
    reviewList.data = null;
    reviewList = ApiResponse.loading();
    notifyListeners();
  }

  setMoviesList(ApiResponse<Movie> response) {
    if (response.status == Status.completed) {
      if (pagin! > 1) {
        List<MovieItem>? _listTemp = [];

        _listTemp.addAll(moviesList.data!.results!);
        _listTemp.addAll(response.data!.results!);

        moviesList.data?.results = _listTemp;
      } else {
        moviesList = response;
      }
      pagin = pagin! + 1;
    } else {
      if (pagin == 1) {
        moviesList = response;
      }
    }

    notifyListeners();
  }

  setReviewMoviesList(ApiResponse<ReviewMovie> response) {
    if (response.status == Status.completed) {
      if (paginReview! > 1) {
        List<Review>? _listTemp = [];

        _listTemp.addAll(reviewList.data!.reviews!);
        _listTemp.addAll(response.data!.reviews!);

        reviewList.data?.reviews = _listTemp;
      } else {
        if (kDebugMode) {
          print("Set response");
          print(response.data!.reviews!.first.toString());
        }
        reviewList = response;
      }
      paginReview = paginReview! + 1;
    } else {
      if (paginReview == 1) {
        reviewList = response;
      }
    }

    notifyListeners();
  }

  Future<void> fetchMovies() async {
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMovies(_pagin!, movieStatusSelected).then(
      (value) {
        setMoviesList(ApiResponse.completed(value));
      },
    ).onError(
      (error, stackTrace) {
        setMoviesList(ApiResponse.error(error.toString()));
      },
    );
  }

  Future<void> fetchReviewMovies(int idMovie) async {
    setReviewMoviesList(ApiResponse.loading());
    _myRepo.fetchMovieReview(_pagin!, idMovie).then(
      (value) {
        if (kDebugMode) {
          print("Fetch review list completed");
          print(value);
        }
        setReviewMoviesList(ApiResponse.completed(value));
      },
    ).onError(
      (error, stackTrace) {
        setReviewMoviesList(ApiResponse.error(error.toString()));
      },
    );
  }
}
