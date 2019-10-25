class Movie {
    String title; // 名称
    String imageUrl; // 图片链接
    int commentCount; // 评论数
    double mark; // 评分
    String type; // 类型

    Movie.fromMap(Map<String,dynamic> json) {
        this.title = json["title"];
        this.imageUrl = json["images"]["small"];
        this.commentCount = json["collect_count"];
        this.mark = json["rating"]["average"];
        List genres = json["genres"];
        this.type = genres.join(" / ");
    }
}