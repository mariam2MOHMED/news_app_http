import 'package:flutter/material.dart';
import 'package:news_app_route/api_manager/api_services.dart';
import 'package:news_app_route/widgets/error_indictor.dart';
import 'package:news_app_route/widgets/loading_indicitor.dart';

import 'new_item.dart';

class NewsList extends StatefulWidget {
  final String sourceId;
  const NewsList(this.sourceId,{super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  int page=1;
  int pageSize=20;
  ScrollController scrollController=ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
  if(scrollController.position.atEdge){
    print("atEdge---------------");
    if(scrollController.offset!=0){
      setState(() {

      });
      page++;
      scrollController.animateTo(
        0,curve:Curves.bounceOut ,
        duration: Duration(seconds: 1)
      );

    }
  }

    });
  }
  @override
  Widget build(BuildContext context) {


    return
      FutureBuilder(
      future: ApiServices.getNews(sourceId: widget.sourceId,
      page: page,
        pageSize: pageSize
      ),
      builder: (context,snapShot){
       if(snapShot.connectionState==ConnectionState.waiting){
         return loadingIndicitor();
       }else if(snapShot.hasError||snapShot.data!.status!='ok'){
         return errorIndictor();
       }else{
         final newsList=snapShot.data?.articles??[];
         return  RefreshIndicator(
           onRefresh: ()async{
             setState(() {

               page=1;
             });
           },
           child: ListView.builder(
             controller:scrollController ,
             itemBuilder: (_,index){
             return newsItem(newsList[index]);
           },itemCount: newsList.length,),
         );
       }
      },


    );
  }
}
