import 'package:flutter/material.dart';
import 'package:flutter_movie_sample/view/Home/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Movie'),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(homeController),
      body: Obx(() => IndexedStack(
        index: homeController.currentIndex.value,
        children: homeController.pages,
      )),
    );
  }

  _buildBottomNavigationBar(HomeController homeController) {
    return Obx(() => BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Filmlerim',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Ara',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profilim',
        ),
      ],
      currentIndex: homeController.currentIndex.value,
      onTap: homeController.changeBottomNavigation,
    ));
  }
}
