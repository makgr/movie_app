import 'package:flutter/material.dart';
import 'package:movie_app/data/movies.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/screens/movie_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Movie> movieList = [];

  List<Movie> showMovies() {
    List movies = MovieList.movies;

    for (var movie in movies) {
      movieList.add(Movie.fromJson(movie));
    }
    return movieList;
  }

  @override
  void initState() {
    super.initState();
    showMovies();
  }

  bool imageReady = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Text(movieList[index].title),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MovieDetails(movie: movieList[index])));
                },
              ),
            );
          }),
    );
  }
}
