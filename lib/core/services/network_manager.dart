import 'package:dio/dio.dart';
import 'package:flutter_movie_sample/core/model/base_model.dart';
import 'package:flutter_movie_sample/core/model/response_model.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../constants/app_constants.dart';
import '../enum/http_types.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  Dio? dio;

  NetworkManager._init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: AppConstants.API_BASE_URL,
    );

    dio = Dio(baseOptions);
  }

  changeBaseUrl(String baseUrl) {
    if (dio != null) {
      dio!.options.baseUrl = baseUrl;
    }
  }

  Future<ResponseModel<R>> request<R, T extends BaseModel>(String path,
      {required HttpTypes httpType,
      required T parseModel,
      Map<String, dynamic>? queryParameters,
      dynamic data}) async {
    if (queryParameters != null) {
      queryParameters!["apiKey"] = AppConstants.API_KEY;
    } else {
      queryParameters = {"apiKey": AppConstants.API_KEY};
    }

    final response = await dio!.request(path,
        data: data,
        queryParameters: queryParameters,
        options: Options(method: _getMethodName(httpType)));

    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final parsedModel = _parseModel<R, T>(parseModel, response.data);
        return ResponseModel<R>(
            data: parsedModel, statusCode: response.statusCode);
      default:
        return ResponseModel(
            statusCode: response.statusCode, error: 'Network Manager error');
    }
  }

  R? _parseModel<R, T>(BaseModel baseModel, dynamic data) {
    if (data is List) {
      return data.map((e) => baseModel.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return baseModel.fromJson(data as Map<String, dynamic>) as R;
    }
    return data as R;
  }

  String _getMethodName(HttpTypes httpTypes) {
    switch (httpTypes) {
      case HttpTypes.post:
        return 'POST';
      case HttpTypes.delete:
        return 'DELETE';
      case HttpTypes.put:
        return 'PUT';
      case HttpTypes.get:
      default:
        return 'GET';
    }
  }
}
