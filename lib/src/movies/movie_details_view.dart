import 'package:filmmediadb/src/core/http_service.dart';
import 'package:filmmediadb/src/models/genre.dart';
import 'package:filmmediadb/src/models/movie_detail.dart';
import 'package:filmmediadb/src/utils/format.dart';
import 'package:flutter/material.dart';

class MovieDetailsView extends StatefulWidget {
  MovieDetailsView({super.key,required this.movieId});

  int movieId;
  static const routeName = '/sample_item';

  @override
  State<StatefulWidget> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView>{
  
  MovieDetail item = MovieDetail.empty();

  @override
  void initState() {
    //initilize details
    _getDetails(widget.movieId);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF242A32)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          Expanded(child: body()),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3A3F47)
              ),
              onPressed: () => Navigator.of(context).pop(), 
              child: const Row(
              mainAxisSize: MainAxisSize.min,
               children: [
                Icon(Icons.arrow_back),
                Text(" Back")
               ],
              )
              ),
          )
        ],
      ),
    );
    
  }

  _getDetails(int id) async{
    HTTPService().getMovieDetail(id).then((response) {
      setState(() {
        item = response;
      });
    });
	}
  
  Widget header() {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              height: 210.94,
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: item.backdropPath != "" ? NetworkImage("https://image.tmdb.org/t/p/w500${item.backdropPath}")
                  : const NetworkImage("https://via.placeholder.com/375x211"),
                  fit: BoxFit.fill,
                ),
                shape:const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 29,
            top: 151,
            child: Container(
              width: 95,
              height: 120,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: item.posterPath != "" ? NetworkImage("https://image.tmdb.org/t/p/w500${item.posterPath}")
                  : const NetworkImage("https://via.placeholder.com/95x120") ,
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Positioned(
            left: 136,
            top: 223,
            child: SizedBox(
              width: 210,
              height: 48,
              child: Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget body(){
    List<Genre> genreList = item.genreList;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genreList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final element = genreList[index];
              
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 7),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF3A3F47),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )
                      ),
                      child: Center(
                        child: Text(
                          element.name,
                          style: const TextStyle(
                            color: Color(0xFFEEEEEE),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400
                          ),)
                        )
                      );
                  },),
          ),
          const Padding(
            padding: EdgeInsets.only(top:22.0),
            child: Text("Overviews",
              style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            width: 317,
            height: 87,
            child: Text(
              item.overview,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (1 / .3)
              ),
              children: [
                extraInfo('Duration:',item.runtime),
                const SizedBox(),
                extraInfo('Release Date:',FormatUtils.formatDate(item.releaseDate)),
                extraInfo('Average Rating:',item.voteAverage),
                extraInfo('Rate Count:',item.voteCount),
                extraInfo('Popularity:',item.popularity),
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget extraInfo(String header, value){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          height: 0,
        ),),
        Text(value.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 0,
        ),)
      ]);
  }

}
