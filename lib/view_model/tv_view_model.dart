// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/response/api_response.dart';
import '../data/response/status.dart';
import '../model/review_tv_model.dart';
import '../model/tv_model.dart';
import '../repository/tv_repository.dart';
import '../res/enum/tv_status.dart';

class TvViewModel with ChangeNotifier {
  final _myRepo = TvRepository();

  int? _pagin = 1;
  int? get pagin => _pagin;

  int? _paginReview = 1;
  int? get paginReview => _paginReview;

  int get countTv {
    return tvList != null ? tvList.data!.results!.length : 0;
  }

  ApiResponse<TvModel> tvList = ApiResponse.loading();
  ApiResponse<ReviewTvModel> reviewList = ApiResponse.loading();

  TvStatus _tvStatusSelected = TvStatus.tvOnAir;
  TvStatus get tvStatusSelected => _tvStatusSelected;

  Future<void> changeStatusSelected(TvStatus val) async {
    await clearData();
    _tvStatusSelected = val;
    notifyListeners();
  }

  bool isLoadingMore(int i) {
    return (i + 1) == countTv;
  }

  Future<void> clearData() async {
    pagin = 1;
    tvList.data = null;
    tvList = ApiResponse.loading();
    notifyListeners();
  }

  Future<void> clearDataComment() async {
    paginReview = 1;
    reviewList.data = null;
    reviewList = ApiResponse.loading();
    notifyListeners();
  }

  set pagin(int? pagin) {
    _pagin = pagin;
    notifyListeners();
  }

  set paginReview(int? pagin) {
    _paginReview = pagin;
    notifyListeners();
  }

  setTvList(ApiResponse<TvModel> response) {
    if (response.status == Status.completed) {
      if (pagin! > 1) {
        List<TvItem>? _listTemp = [];

        _listTemp.addAll(tvList.data!.results!);
        _listTemp.addAll(response.data!.results!);

        tvList.data?.results = _listTemp;
      } else {
        tvList = response;
      }
      pagin = pagin! + 1;
    } else {
      if (pagin == 1) {
        tvList = response;
      }
    }

    notifyListeners();
  }

  setReviewTvList(ApiResponse<ReviewTvModel> response) {
    if (response.status == Status.completed) {
      if (paginReview! > 1) {
        List<ReviewTv>? _listTemp = [];

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

  Future<void> fetchTv() async {
    setTvList(ApiResponse.loading());
    _myRepo.fetchTv(_pagin!, tvStatusSelected).then(
      (value) {
        setTvList(ApiResponse.completed(value));
      },
    ).onError(
      (error, stackTrace) {
        if (kDebugMode) {
          print("Check response TV error");
          print(error.toString());
        }
        setTvList(ApiResponse.error(error.toString()));
      },
    );
  }

  Future<void> fetchReviewTv(int id) async {
    setReviewTvList(ApiResponse.loading());
    _myRepo.fetchTvReview(_pagin!, id).then(
      (value) {
        setReviewTvList(ApiResponse.completed(value));
      },
    ).onError(
      (error, stackTrace) {
        setReviewTvList(ApiResponse.error(error.toString()));
      },
    );
  }
}
