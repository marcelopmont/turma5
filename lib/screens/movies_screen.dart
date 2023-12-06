import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movie> moviesList = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )),
      backgroundColor: Colors.teal,
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: moviesList.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final movie = moviesList[index];
          return Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            child: ListTile(
              title: Text(movie.title),
              subtitle: Text(movie.description),
              trailing: Text(movie.rating.toString()),
            ),
          );
        },
      ),
    );
  }

  Future<void> fetchMovies() async {
    try {
      final uri = Uri.parse('http://demo1559983.mockable.io/movies');
      final response = await Client().get(uri);

      final moviesJson = jsonDecode(response.body)['movies'];

      for (final movieJson in moviesJson) {
        final movie = Movie(
          title: movieJson['original_title'],
          description: movieJson['overview'],
          rating: movieJson['rating'],
        );

        moviesList.add(movie);
      }
      setState(() {});
    } catch (e) {
      print('Erro ao buscar filmes');
    }
  }
}

class Movie {
  const Movie({
    required this.title,
    required this.description,
    required this.rating,
  });

  final String title;
  final String description;
  final double rating;
}
