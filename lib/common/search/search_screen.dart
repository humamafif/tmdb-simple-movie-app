import 'package:flutter/material.dart';
import 'package:movieapp/core/color_constant.dart';
import 'package:movieapp/common/search/search_result.dart';
import 'package:movieapp/common/search/search_widget.dart';
import 'package:movieapp/feature/movies/services/api_service.dart';
import 'package:movieapp/feature/movies/model/movie_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<MovieModel> movieFilter = [];
  List<MovieModel> dataMovie = [];
  int movieCount = 0;
  TextEditingController searchController = TextEditingController();
  ApiService apiService = ApiService();

  Future initialize() async {
    dataMovie = await apiService.getPopularMovies();
    setState(() {
      movieCount = dataMovie.length;
      movieFilter = dataMovie;
    });
  }

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    initialize();
  }

  void _searchMovie(String query) {
    final filteredList = dataMovie.where((movie) {
      final title = movie.title.toLowerCase();
      final searchLower = query.toLowerCase();

      return title.contains(searchLower);
    }).toList();

    setState(() {
      movieFilter = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            "Search Movie",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            // Widget search bar
            SearchWidget(
              searchController: searchController,
              onSearchChanged: _searchMovie,
            ),
            const SizedBox(height: 10),
            // Menampilkan hasil pencarian berdasarkan movieFilter
            SearchResult(
              movieFilter: movieFilter,
            ),
          ],
        ),
      ),
    );
  }
}
