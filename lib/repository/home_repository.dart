// ignore_for_file: no_leading_underscores_for_local_identifiers, use_rethrow_when_possible

import 'package:flutter/foundation.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/movie_model.dart';
import '../model/review_movie_model.dart';
import '../res/app_url.dart';
import '../res/const.dart';
import '../res/enum/movie_status.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<Movie> fetchMovies(
    int _page,
    MovieStatus status,
  ) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
        AppUrl.movieList(
          _page,
          status,
        ),
      );
      return response = Movie.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<ReviewMovie> fetchMovieReview(
    int page,
    int idMovie,
  ) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
        AppUrl.movieReview(
          page,
          idMovie,
        ),
      );

      return response = ReviewMovie.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
