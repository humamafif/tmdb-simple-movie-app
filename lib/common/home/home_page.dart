import 'package:flutter/material.dart';
import 'package:movieapp/core/color_constant.dart';
import 'package:movieapp/common/home/header.dart';
import 'package:movieapp/feature/movies/services/api_service.dart';
import 'package:movieapp/feature/movies/model/movie_model.dart';
import 'package:movieapp/feature/movies/presentation/movie/news_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> dataMovie = [];
  int movieCount = 0;
  late ApiService apiService;

  Future initialize() async {
    dataMovie = await apiService.getPopularMovies();
    setState(() {
      movieCount = dataMovie.length;
      dataMovie = dataMovie;
    });
  }

  @override
  void initState() {
    apiService = ApiService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: const Text(
          "Trending for you",
          style: TextStyle(
              color: white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              dataMovie: dataMovie,
            ),
            NewsMovie(
              dataMovie: dataMovie,
            ),
          ],
        ),
      ),
    );
  }
}
