import 'package:flutter/material.dart';
import 'package:flutter_example/model/model_movie.dart';
import 'package:flutter_example/widget/box_slider.dart';
import 'package:flutter_example/widget/carousel_slider.dart';
import 'package:flutter_example/widget/circle_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap(
      {
        'title': '사랑의 불시착',
        'keyword': '사랑/로멘스/판타지',
        'poster': 'test_movie_1.png',
        'like': false
      },
    ),
    Movie.fromMap(
      {
        'title': '사랑의 불시착',
        'keyword': '사랑/로멘스/판타지',
        'poster': 'test_movie_1.png',
        'like': false
      },
    ),
    Movie.fromMap(
      {
        'title': '사랑의 불시착',
        'keyword': '사랑/로멘스/판타지',
        'poster': 'test_movie_1.png',
        'like': false
      },
    ),
    Movie.fromMap(
      {
        'title': '사랑의 불시착',
        'keyword': '사랑/로멘스/판타지',
        'poster': 'test_movie_1.png',
        'like': false
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            CarouselImage(movies: movies),
            const TopBar(),
          ],
        ),
        CircleSlider(movies: movies),
        BoxSlider(movies: movies),
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'images/bbongflix_logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.only(
              right: 1,
            ),
            child: const Text(
              'TV 프로그램',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              right: 1,
            ),
            child: const Text(
              '영화',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              right: 1,
            ),
            child: const Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
