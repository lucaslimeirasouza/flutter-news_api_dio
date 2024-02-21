import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api_dio_rest/models/article_model.dart';
import 'package:flutter_news_api_dio_rest/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel>? articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles!.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsTile(
              articleModel: articles![index],
            ),
          );
        },
      ),
    );
  }
}
