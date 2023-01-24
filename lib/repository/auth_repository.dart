import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/genre_model.dart';
import '../res/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<GenresModel> fetchGenres() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
        AppUrl.genre,
      );

      return response = GenresModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
