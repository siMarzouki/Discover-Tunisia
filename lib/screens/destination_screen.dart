import 'package:flutter/material.dart';
import 'dart:math';
import '../data/images.dart';
import '../models/destination.dart';
import 'details_screen.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({Key? key}) : super(key: key);
  static const routeName = "/destination";
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    final des = ModalRoute.of(context)!.settings.arguments as Destination;
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      theme: Theme.of(context),
      home: DefaultTabController(
        length: des.slides.length,
        child: Scaffold(
            body: Stack(
          children: [
            TabBarView(children: [
              ...des.slides
                  .map((e) => slide(
                      context, pics[des.img]![des.slides.indexOf(e)], e.main))
                  .toList(),
            ]),
            SizedBox(
              height: max(size.height * 0.15, 100),
              child: AppBar(
                title: Text(
                  des.name,
                ),
                backgroundColor: Colors.black54,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                bottom: TabBar(
                  labelColor: Colors.white,
                  isScrollable: true,
                  indicatorWeight: 3,
                  indicatorColor: Colors.cyan,
                  tabs:
                      des.slides.map((e) => Text(e.subtitle ?? "...")).toList(),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.help),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(DetailsScreen.routeName, arguments: des);
                    },
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

Widget slide(BuildContext ctx, String imgpath, String text) {
  final size = MediaQuery.of(ctx).size;

  return Stack(
    children: [
      Container(
        height: MediaQuery.of(ctx).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imgpath),
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        width: MediaQuery.of(ctx).size.width - 10,
        height: max(size.height * 0.28, 130),
        right: 5,
        child: Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.8),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3, color: Colors.cyan)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Scrollbar(
              child: ListView(
                children: [
                  Text(
                    text.split(". ").join(".\n\n"),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontFamily: "FiraSans"),
                  ),
                ],
              ),
            )),
      )
    ],
  );
}
