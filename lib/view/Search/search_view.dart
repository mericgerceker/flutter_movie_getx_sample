import 'package:flutter/material.dart';
import 'package:flutter_movie_sample/view/MovieDetail/movie_detail.dart';
import 'package:flutter_movie_sample/view/Search/search_controller.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.put(SearchController());

    //searchController.search('Harry Potter');

    return Scaffold(
      body: Obx(() => searchController.isLoading.value ? const Center(child: CircularProgressIndicator()) : Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: searchController.searchFieldController,
              onEditingComplete: () => searchController.search(),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.cancel_outlined),
                    onPressed: () => searchController.reset(),
                  )),
            ),
          ),
          Expanded(
            child: searchController.searchResult.isNotEmpty
                ? GetBuilder<SearchController>(
                  builder: (searchController) => ListView.builder(
                    itemCount: searchController.searchResult.length,
                    itemBuilder: (context, index) {
                      var item = searchController.searchResult[index];
                      return ListTile(
                        title: Text(item.name ?? 'Empty Name'),
                        subtitle: Text("${ item.type } - ${ item.year }"),
                        onTap: () {
                          Get.to(const MovieDetail(), arguments: item);
                        },
                      );
                    },
                  ),
                )
                : const Center(
              child: Text('empty'),
            ),
          ),
        ],
      )),
    );
  }
}
