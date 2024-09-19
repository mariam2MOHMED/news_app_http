import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_route/appTheme.dart';
import 'package:news_app_route/models/News.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'news_detials.dart';
class newsItem extends StatelessWidget {
  Articles articles;
   newsItem(this.articles,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0,
          vertical: 16.0),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, NewsDetials.routeName,
          arguments: articles
          );
        },
        child:
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(articles.urlToImage??"https://rapidapi.com/blog/wp-content/uploads/2020/01/Top-10-Best-News-API-refresh_blogimage_v3.jpg",
                width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.25,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 4.0,),
              Text(articles.source!.name??"",style: Theme.of(context).textTheme.titleSmall!.
              copyWith(
                color: AppTheme.grey
              ),),
              SizedBox(height: 4.0,),
              Text(articles.title??"",style: Theme.of(context).textTheme.titleSmall!.
              copyWith(
                  fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 4.0,),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(articles.publishedAt!.substring(0,10)??"",

                  style: Theme.of(context).textTheme.titleSmall!.
                copyWith(
                    color: AppTheme.grey
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
