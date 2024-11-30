import 'package:flutter/material.dart';
import 'package:movieapp/core/color_constant.dart';
import 'package:movieapp/feature/movies/model/movie_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.movieModel,
  });
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          movieModel.title,
          style: TextStyle(
              color: white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/${movieModel.posterPath}"),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  movieModel.releaseDate,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(151, 255, 255, 255),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      movieModel.voteAverage.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: white,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Divider(),
            Text(
              movieModel.overview,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
