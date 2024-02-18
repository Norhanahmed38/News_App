import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewService {
  final Dio dio;

  NewService(this.dio);
  Future<List<ArticaleModel>> getNews() async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=43cba2188b0b4c758a9e26fb98548c64&category=general');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticaleModel> articlesList = [];

      for (var article in articles) {
        ArticaleModel articleModel = ArticaleModel(
          image: article['urlToImage'],
          title: article['title'],
          subTitle: article['description'],
        );
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
