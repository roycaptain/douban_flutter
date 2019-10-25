import 'package:flutter/material.dart';
import 'package:douban_app/movie_model.dart';

class MoiveRow extends StatelessWidget {

    final Movie movie;

    MoiveRow(this.movie);

    // 电影排名
    Widget MovieRankWidget() {
        return Container(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.orange,
            ),
            child: Text("No.1",style: TextStyle(fontSize: 18.0,color: Colors.white),),
        );
    }

    // 具体内容
    Widget MovieContent() {
        return Container(
            height: 150,
            child: Row(
                children: <Widget>[
                    MovieIcon(),
                    MovieDescribe(),
                ],
            ),
        );
    }

    // 电影图片
    Widget MovieIcon() {
        return ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(movie.imageUrl),
        );
    }

    // 描述
    Widget MovieDescribe() {
        return Expanded(
            child: Container(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        MovieTitle(),
                        Padding(padding: EdgeInsets.only(top: 5.0),),
                        MovieMark(),
                        Padding(padding: EdgeInsets.only(top: 5.0),),
                        MovieDetail(),
                    ],
                ),
            ),
        );
    }

    // 电影名称
    Widget MovieTitle() {
        return Text(
            "${movie.title}",
            style: TextStyle(fontSize: 20.0,color: Colors.black),
        );
    }

    // 评分
    Widget MovieMark() {
        return Text("豆瓣评分: ${movie.mark}",style: TextStyle(fontSize: 13.0,color: Colors.grey),);
    }

    // 具体详情
    Widget MovieDetail() {
        return Text(
            "${movie.type}",
            maxLines: 5,
            softWrap: true,
            style: TextStyle(fontSize: 16.0,color: Colors.grey),
        );
    }

    // 评价
    Widget MovieComment() {
        return Container(
            color: Colors.black12,
            height: 30.0,
            padding: EdgeInsets.all(5.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Text("${movie.commentCount}评价",style: TextStyle(fontSize: 15.0,color: Colors.blueGrey),)
                ],
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration( // 分割线
                    border: Border(bottom: BorderSide(width: 10, color: Colors.black12))
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    // 排名
                    MovieRankWidget(),
                    Padding(padding: EdgeInsets.only(top: 10.0),),
                    // 具体内容
                    MovieContent(),
                    Padding(padding: EdgeInsets.only(top: 10.0),),
                    // 评价
                    MovieComment(),
                ],
            ),
        );
    }
}