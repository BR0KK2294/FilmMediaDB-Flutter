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

    //testing items;
    items = [MovieItem(1, "Avengers", DateTime.now(), 6.8, "imgPoster")];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return movieCard(item);
        },
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
                image: const DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/95x120"),
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
}
