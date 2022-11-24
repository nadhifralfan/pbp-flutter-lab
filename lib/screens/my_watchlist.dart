import 'package:flutter/material.dart';
import 'package:counter_7/screens/my_watchlist_detail.dart';
import 'package:counter_7/components/drawer_component.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/models/my_watchlist_model.dart';

class MyWatchListScreen extends StatefulWidget {
  const MyWatchListScreen({Key? key}) : super(key: key);

  @override
  State<MyWatchListScreen> createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchListScreen> {
  Future<List<MyWatchList>> fetchWatchlist() async {
    var url =
        Uri.parse('https://nadhif-tugas-2-pbp.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    // melakukan konversi data json menjadi object MyWatchlist
    List<MyWatchList> listMyWatchlist = [];
    for (var d in data) {
      if (d != null) {
        listMyWatchlist.add(MyWatchList.fromJson(d));
      }
    }
    return listMyWatchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watchlist'),
        ),
        drawer: const DrawerComponents(currentPage: "My Watchlist"),
        body: FutureBuilder(
            future: fetchWatchlist(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada to do list",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black, blurRadius: 2.0)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data![index].title}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Checkbox(
                                    value: snapshot.data![index].watched,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        snapshot.data![index].watched =
                                            !snapshot.data![index].watched;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => WatchListDetail(
                                            movieDetail: snapshot.data[index],
                                          ))));
                            },
                          ));
                }
              }
            }));
  }
}
