import 'package:counter_7/models/my_watchlist_model.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/components/drawer_component.dart';

TextStyle judul = const TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
TextStyle lead = const TextStyle(fontWeight: FontWeight.w600, fontSize: 20);
TextStyle data = const TextStyle(fontWeight: FontWeight.normal, fontSize: 20);

class WatchListDetail extends StatelessWidget {
  final MyWatchList movieDetail;
  const WatchListDetail({Key? key, required this.movieDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist'),
      ),
      drawer: const DrawerComponents(currentPage: 'My Watchlist'),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                      child: Text(
                    movieDetail.title,
                    style: judul,
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Release Date: ",
                        style: lead,
                      ),
                      Text(
                        movieDetail.releaseDate,
                        style: data,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Rating: ",
                        style: lead,
                      ),
                      Text(
                        "${movieDetail.rating}/5",
                        style: data,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Watched: ",
                        style: lead,
                      ),
                      Text(
                        movieDetail.watched ? "Yes" : "No",
                        style: data,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Review: ", style: lead),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          movieDetail.review,
                          style: data,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Back",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
