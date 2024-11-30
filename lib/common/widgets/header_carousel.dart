import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/feature/movies/model/movie_model.dart';

class HeaderCarousel extends StatefulWidget {
  final List<MovieModel> reelsData;
  final CarouselSliderController controller;
  final int current;
  final ValueChanged<int> onPageChanged;

  const HeaderCarousel({
    super.key,
    required this.reelsData,
    required this.controller,
    required this.current,
    required this.onPageChanged,
  });

  @override
  _HeaderCarouselState createState() => _HeaderCarouselState();
}

class _HeaderCarouselState extends State<HeaderCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                widget.onPageChanged(index);
              },
              height: MediaQuery.of(context).size.height / 2,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
            ),
            items: widget.reelsData.map((data) {
              return Builder(
                builder: (BuildContext context) {
                  print("image");
                  print(data);
                  return Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500/${data.posterPath}"),
                          fit: BoxFit.fill),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.9),
                                Colors.black.withOpacity(0.6),
                              ],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 170,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w500/${data.posterPath}"),
                                    )),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.reelsData[widget.current].title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 20.0,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        widget.reelsData[widget.current]
                                            .voteAverage
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
