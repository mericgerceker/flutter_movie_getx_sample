import 'package:flutter/material.dart';
import 'package:flutter_movie_sample/view/MovieDetail/movie_detail_controller.dart';

class MovieDetail extends StatelessWidget {


  const MovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieDetailController movieDetailController = MovieDetailController();
    var movie = movieDetailController.detail;

    return Scaffold(
      appBar: AppBar(
        title: Text('Film Detayı'),
      ),
      body: Column(
        children: [
          Text(movie.name!),
        ],
      ),
    );
  }
}
