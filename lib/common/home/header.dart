import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/common/widgets/header_carousel.dart';
import 'package:movieapp/feature/movies/model/movie_model.dart';

class Header extends StatefulWidget {
  final List<MovieModel> dataMovie;
  const Header({super.key, required this.dataMovie});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return HeaderCarousel(
      reelsData: widget.dataMovie,
      controller: _controller,
      current: _current,
      onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },
    );
  }
}
