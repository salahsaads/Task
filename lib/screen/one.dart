import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15),
          child: GNav(
              gap: 8, // the tab button gap between icon and text
              color: Colors.grey[800], // unselected icon color
              activeColor: Colors.purple, // selected icon and text color
              iconSize: 24, // tab button icon size
              tabBackgroundColor: Colors.purple
                  .withOpacity(0.1), // selected tab background color
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 5), // navigation bar padding
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Likes',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                )
              ]),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xffb66ac4),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.star_border),
            ),
            Icon(Icons.menu)
          ],
        ),
        body: Column(
          children: [CarouselWithDotsPage()],
        ));
  }
}

class CarouselWithDotsPage extends StatefulWidget {
  CarouselWithDotsPage();

  @override
  _CarouselWithDotsPageState createState() => _CarouselWithDotsPageState();
}

class _CarouselWithDotsPageState extends State<CarouselWithDotsPage> {
  int _current = 0;
  int w = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> title = ['A1 reading', 'A2 reading', 'B1 reading'];
    final List<String> content1 = [
      'Reading practice to help you understand simple information, words and sentences about known topics.',
      'Reading practice to help you understand simple texts and find specific information in everyday material. Texts include emails,',
      'Reading practice to help you understand texts with everyday or job-related language'
    ];
    final List<String> content2 = [
      'Our online English classes feature lots of useful learning materials and activities to help you develop your reading skills with confidence in a safe and inclusive learning environment.',
      'Reading practice to help you understand long, complex texts about a wide variety of topics, some of which may be unfamiliar. Texts include specialised articles, biographies and summaries.',
      'Reading practice to help you understand texts with a wide vocabulary where you may need to consider the writer'
    ];

    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    ];
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();

    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  w = index;
                });
              }),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title[w],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5, right: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      content1[w],
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 239, 213, 244),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 20),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About Painting',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  content2[w],
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            height: 270,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 239, 213, 244),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}
