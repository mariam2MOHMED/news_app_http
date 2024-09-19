import 'package:flutter/material.dart';
import 'package:news_app_route/news/new_item.dart';
import 'package:news_app_route/widgets/error_indictor.dart';
import 'package:news_app_route/widgets/loading_indicitor.dart';

import '../api_manager/api_services.dart';

class searchTab extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {

   return [


        IconButton(onPressed: (){
         showResults(context);
       }, icon: Icon(Icons.search)),

   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {

return   Container(
  width: double.infinity,
  height: double.infinity,
  decoration: BoxDecoration(
      color: Colors.white,
      image: DecorationImage(image: AssetImage('assets/pattern.png'))
  ),
  child: Scaffold(
    body: IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon:
    Icon(Icons.arrow_back_ios)),
  ),
);
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getNews(query: query),
      builder: (context,snapShot){
        if(snapShot.connectionState==ConnectionState.waiting){
          return loadingIndicitor();
        }else if(snapShot.hasError||snapShot.data!.status!='ok'){
          return errorIndictor();
        }else{
          final newsList=snapShot.data?.articles??[];
          return
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage('assets/pattern.png'))
              ),
              child: Scaffold(
                body: ListView.builder(itemBuilder: (_,index){
                return newsItem(newsList[index]);
                          },itemCount: newsList.length,),
              ),
            );
        }
      },


    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage('assets/pattern.png'))
      ),
    );
  }

}
