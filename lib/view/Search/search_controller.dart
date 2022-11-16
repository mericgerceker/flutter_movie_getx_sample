import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../core/model/search_model.dart';
import '../../core/services/network_service.dart';

class SearchController extends GetxController {
  final NetworkService _networkService = NetworkService();
  var searchResult = <TitleResults>[].obs;
  var isLoading = false.obs;

  TextEditingController searchFieldController = new TextEditingController();

  Future<void> search() async {
    try {
      isLoading.value = true;
      var searchResponse = await _networkService.search(query: searchFieldController.text);
      if (searchResponse.statusCode == HttpStatus.ok && searchResponse.data != null) {
        searchResult.value = searchResponse.data!.titleResults!;
      }
    }
    catch (e) {

    } finally {
      isLoading.value = false;
    }
  }

  void reset() {
    searchFieldController.text = '';
    searchResult.value = [];
  }
}