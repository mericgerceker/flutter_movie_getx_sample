import 'package:flutter/material.dart';
import 'package:flutter_movie_sample/view/MyProfile/my_profile_view.dart';
import 'package:flutter_movie_sample/view/Search/search_view.dart';
import 'package:get/get.dart';

import '../MyMovies/my_movies_view.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  final pages = [
    const MyMoviesView(),
    const SearchView(),
    const MyProfileView(),
  ];

  void changeBottomNavigation(int index) {
    currentIndex.value = index;
  }
}