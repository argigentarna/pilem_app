// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/foundation.dart';
import 'package:pilem_app/res/enum/tv_status.dart';

import 'const.dart';
import 'enum/movie_status.dart';

class AppUrl {
  static var baseUrl = 'https://api.themoviedb.org/3';
  static var imageUrl = 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/';

  static var movie = '$baseUrl/movie';
  static var tv = '$baseUrl/tv';

  static String genre = '$baseUrl/genre/movie/list?api_key=${AppConst.apiKey}';

  static String movieList(
    int page,
    MovieStatus status,
  ) {
    switch (status) {
      case MovieStatus.popular:
        return '$movie/popular?api_key=${AppConst.apiKey}&page=$page';
      case MovieStatus.upcoming:
        return '$movie/upcoming?api_key=${AppConst.apiKey}&page=$page';
      case MovieStatus.nowPlaying:
        return '$movie/now_playing?api_key=${AppConst.apiKey}&page=$page';
    }
  }

  static String movieReview(int page, int id) {
    return '$movie/${id.toString()}/reviews?api_key=${AppConst.apiKey}&page=1';
  }

  static String tvReview(int page, int id) {
    return '$tv/${id.toString()}/reviews?api_key=${AppConst.apiKey}&page=1';
  }

  static String tvList(
    int page,
    TvStatus status,
  ) {
    switch (status) {
      case TvStatus.popular:
        return '$tv/popular?api_key=${AppConst.apiKey}&page=$page';
      case TvStatus.tvOnAir:
        return '$tv/on_the_air?api_key=${AppConst.apiKey}&page=$page';
    }
  }

  static String showImageUrl(String img) {
    return "$imageUrl/$img";
  }
}
