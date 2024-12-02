import 'package:flutter/material.dart';
import 'package:movieapp/core/color_constant.dart';
import 'package:movieapp/feature/movies/model/movie_model.dart';
import 'package:movieapp/feature/movies/presentation/details/detail_page.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.movieFilter});
  final List<MovieModel> movieFilter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: movieFilter.isEmpty
          ? const Center(
              child: Text(
              'No Result..',
              style: TextStyle(color: white),
            ))
          : ListView.builder(
              itemCount: movieFilter.length,
              itemBuilder: (context, index) {
                print("title");
                print(movieFilter[index].title);
                final MovieModel movie = movieFilter[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            movieModel: movie,
                          ),
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 110,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500/${movie.posterPath}"))),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              movie.releaseDate,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  " ${movie.voteAverage}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
