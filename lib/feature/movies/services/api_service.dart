import 'package:http/http.dart' as http;
import 'package:movieapp/core/api.dart';
import 'dart:convert';
import 'dart:io';

import 'package:movieapp/feature/movies/model/movie_model.dart';

class ApiService {
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      var response = await http.get(Uri.parse(
          "$baseURL/3/movie/popular?api_key=$apiKey&language=en-US&page=1"));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final movieMap = jsonResponse['results'];
        List<MovieModel> movies =
            movieMap.map<MovieModel>((i) => MovieModel.fromJson(i)).toList();
        print(movies);
        return movies;
      } else {
        print("Error: ${response.statusCode}");
        throw Exception("Failed to load movies");
      }
    } on SocketException catch (e) {
      print("Network error: $e");
      throw Exception("Network error: $e");
    } catch (e) {
      print("Error: $e");
      throw Exception("Failed to load movies");
    }
  }
}
