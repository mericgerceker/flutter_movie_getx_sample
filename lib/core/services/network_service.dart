import 'package:flutter_movie_sample/core/model/response_model.dart';
import 'package:flutter_movie_sample/core/model/search_model.dart';
import 'package:flutter_movie_sample/core/services/network_manager.dart';

import '../enum/http_types.dart';

class NetworkService {
  final NetworkManager? _networkManager = NetworkManager.instance;

  Future<ResponseModel<SearchModel>> search({required String query}) async {
    ResponseModel<SearchModel> response = await _networkManager!
        .request<SearchModel, SearchModel>('/search',
            httpType: HttpTypes.get,
            parseModel: SearchModel(),
            queryParameters: {'search_field': 'name', 'search_value': query});
    return response;
  }
}
