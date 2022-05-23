import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/movie_controller.dart';
import '../model/movie.dart';

class CategoryMovieList extends StatelessWidget {
  const CategoryMovieList({Key? key}) : super(key: key);

  Widget _movieWidget(Movie movie) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(right: 10),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(movie.posterUrl)),
          const SizedBox(
            height: 10,
          ),
          Text(movie.title,
              style: const TextStyle(
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
              )),
          Text(movie.voteAverage.toString(), style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('NEW PLAYING'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Consumer<MovieController>(
              builder: (context, controller, child) {
                return Row(
                  children: List.generate(controller.movies.length,
                          (index) => _movieWidget(controller.movies[index])),
                );
              },
            ),
          )
        ],
      ),
    );
  }

}
