import 'package:flutter/foundation.dart';
import 'package:pilem_app/model/review_tv_model.dart';
import 'package:pilem_app/res/enum/tv_status.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/tv_model.dart';
import '../res/app_url.dart';

class TvRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<TvModel> fetchTv(
    int page,
    TvStatus status,
  ) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
        AppUrl.tvList(
          page,
          status,
        ),
      );
      if (kDebugMode) {
        print("Check response tv");
        print(response.toString());
      }
      return response = TvModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<ReviewTvModel> fetchTvReview(
    int page,
    int id,
  ) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
        AppUrl.tvReview(
          page,
          id,
        ),
      );

      return response = ReviewTvModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
