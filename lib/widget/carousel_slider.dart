import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/model/model_movie.dart';
import 'package:flutter_example/screen/detail_screen.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  const CarouselImage({super.key, required this.movies});

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<Movie>? movies;
  List<Widget>? images;
  List<String>? keywords;
  List<bool>? likes;
  int _currentPage = 0;
  String? _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies?.map((e) => Image.asset('images/${e.poster}')).toList();
    keywords = movies?.map((e) => e.keyword).cast<String>().toList();
    likes = movies?.map((e) => e.like).cast<bool>().toList();
    _currentKeyword = keywords?[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords?[_currentPage];
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword as String,
              style: const TextStyle(fontSize: 11),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      likes![_currentPage]
                          ? IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.check),
                            )
                          : IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                            ),
                      const Text(
                        '내가 찜한 콘텐츠',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.only(left: 12, right: 12))),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                        ),
                        Text(
                          '재생',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) {
                                return DetailScreen(
                                    movie: movies![_currentPage]);
                              },
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.info,
                        ),
                      ),
                      const Text(
                        '정보',
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes!, _currentPage),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int currentPage) {
  List<Widget> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(
      Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == i ? Colors.white : Colors.grey,
        ),
      ),
    );
  }

  return result;
}
