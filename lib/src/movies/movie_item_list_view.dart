import 'package:filmmediadb/src/core/http_service.dart';
import 'package:filmmediadb/src/utils/format.dart';
import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'movie_item.dart';
import 'movie_item_details_view.dart';

class MovieItemListView extends StatefulWidget {
  const MovieItemListView({
    super.key
  });

  static const routeName = '/';

  @override
  State<StatefulWidget> createState() => _MovieItemListViewState();

}

class _MovieItemListViewState extends State<MovieItemListView>{

  late List<MovieItem> items;

  @override
  void initState() {
    super.initState();
    items = List.empty();
    _getMovies();
    //testing items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Media DB'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      body: Column(
        children: [
          const SizedBox(
            height: 200,
            child: Column(
              children: [
                Text("Find your movies"),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search Here"
                  ),
                )
              ],
            ),       
          ),
          Expanded(
            child: ListView.builder(
              restorationId: 'sampleItemListView',
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
          
                return movieCard(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget? movieCard(MovieItem item){
    return GestureDetector(
      onTap: () {
              Navigator.restorablePushNamed(
                context,
                MovieItemDetailsView.routeName,
              );
            },
      child: SizedBox(
        child: Row(
          children: [
            Container(
              width: 95,
              height: 120,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://image.tmdb.org/t/p/w500${item.imgPoster}"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Title:"),
                Text(item.title),
                const Text("Release Date:"),
                Text(FormatUtils.formatDate(item.releaseDate)),
                const Text("Average Rating"),
                Text(item.voteAverage.toString()),
              ],
            )
          ]
          )
      ),
    );
  }

  _getMovies() async{
    HTTPService().fetchMovies().then((response) {
      setState(() {
        items = response;
      });
    });
	}
}
