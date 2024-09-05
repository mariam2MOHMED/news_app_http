import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_route/appTheme.dart';
import 'package:news_app_route/models/News.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetials extends StatelessWidget {
  static const String routeName="/newsDetials";
  // const NewsDetials({super.key});

  @override
  Widget build(BuildContext context) {
    var articles=ModalRoute.of(context)!.settings!.arguments as Articles;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(image: AssetImage('assets/pattern.png',),fit: BoxFit.cover)
      ),
      child: Scaffold(

        appBar: AppBar(
          title: Text("NewsDetials"),
        ),

        body:  Container(
          padding: EdgeInsets.all(24),
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
                child:
                Text(articles.publishedAt!.substring(0,10)??"",

                  style: Theme.of(context).textTheme.titleSmall!.
                  copyWith(
                      color: AppTheme.grey
                  ),),
              ),
              SizedBox(height: 20.0,),
              Text(articles.content??"",
                style: Theme.of(context).textTheme.titleSmall!.
              copyWith(
                  fontWeight: FontWeight.w300,
                  color: Color(0XFF42505C),
              ),),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: (){
                  _launchUrl(articles.url??"");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("View article ",

                      style: Theme.of(context).textTheme.titleLarge!.
                      copyWith(
                          color: AppTheme.grey
                      ),),
                    Icon(Icons.arrow_forward_ios_rounded,color: AppTheme.grey,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
  Future<void> _launchUrl(String url) async {
    final Uri _url=Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
