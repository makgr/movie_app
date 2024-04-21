import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MovieDetails extends StatelessWidget {
  late Movie movie;

  MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: CarouselSlider(
                items: movie.images
                    .map((image) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    initialPage: 1,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true)),
          ),
          Text(
            movie.director,
            style: TextStyle(fontSize: 23),
          ),
        ],
      ),
    );
  }
}
