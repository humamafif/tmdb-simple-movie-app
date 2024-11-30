import 'package:flutter/material.dart';
import 'package:movieapp/core/color_constant.dart';
import 'package:movieapp/feature/movies/model/movie_model.dart';
import 'package:movieapp/feature/movies/presentation/details/detail_page.dart';

class ListNewsMovie extends StatefulWidget {
  final List reelsData;
  const ListNewsMovie({super.key, required this.reelsData});

  @override
  State<ListNewsMovie> createState() => _ListNewsMovieState();
}

class _ListNewsMovieState extends State<ListNewsMovie> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.reelsData.length,
      itemBuilder: (context, index) {
        final MovieModel data = widget.reelsData[index];
        return Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        movieModel: data,
                      ),
                    ));
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 4.2,
                width: 180,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${data.posterPath}"),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              data.title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: white),
            ),
            Row(
              children: [
                const Icon(Icons.visibility_outlined,
                    size: 18.0, color: Color.fromARGB(150, 255, 255, 255)),
                SizedBox(width: 5),
                Text(
                  data.popularity.toString(),
                  style: TextStyle(
                      fontSize: 12, color: Color.fromARGB(150, 255, 255, 255)),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
