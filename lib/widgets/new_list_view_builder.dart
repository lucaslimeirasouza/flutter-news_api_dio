import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api_dio_rest/models/article_model.dart';
import 'package:flutter_news_api_dio_rest/services/news_service.dart';
import 'package:flutter_news_api_dio_rest/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  NewsListViewBuilder({super.key, required this.category});

  final String? category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsService(Dio()).getTopHeadlines(category: widget.category!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(
              articles: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Text('oops  was an error, try later'),
            );
          } else {
            return SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
