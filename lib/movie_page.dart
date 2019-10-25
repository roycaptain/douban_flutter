import 'package:flutter/material.dart';
import 'package:douban_app/movie_row.dart';
import 'package:douban_app/http_request.dart';
import 'package:douban_app/movie_model.dart';

class MovieScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Scaffold(
            appBar: AppBar(
                title: Text("豆瓣影评"),
            ),
            body: MovieList(),
        );
    }
}

class MovieList extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        return MovieListState();
    }
}

class MovieListState extends State<MovieList> {

    List<Movie> movies = [];

    // 电影列表
    void getMoiveListData() {
        var url = "https://douban.uieee.com/v2/movie/top250";
        var params = {"start": "0", "count": "10"};
        RequestManager.getInstance().get(url, params,success: (value){

            setState(() {
                List subjects = value["subjects"];
                subjects.forEach((value) {
                    movies.add(Movie.fromMap(value));
                });
            });

        },failure: (value){
            print("exceptaion- ${value}");
            print("failure");
        });
    }

    @override
    void initState() {
        super.initState();

        getMoiveListData();
    }

    @override
    Widget build(BuildContext context) {
        return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context,index) {
                return MoiveRow(movies[index]);
            },
        );
    }
}