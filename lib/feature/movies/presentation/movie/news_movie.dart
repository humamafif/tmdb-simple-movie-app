import 'package:flutter/material.dart';
import 'package:movieapp/core/color_constant.dart';
import 'package:movieapp/feature/movies/presentation/movie/list_news_movie.dart';

class NewsMovie extends StatefulWidget {
  const NewsMovie({super.key, required this.dataMovie});
  final List dataMovie;

  @override
  State<NewsMovie> createState() => _NewsMovieState();
}

class _NewsMovieState extends State<NewsMovie> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "News Movie",
            style: TextStyle(
              color: white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 8),
              height: MediaQuery.of(context).size.height / 3.3,
              child: ListNewsMovie(
                reelsData: widget.dataMovie,
              )),
        ],
      ),
    );
  }
}
