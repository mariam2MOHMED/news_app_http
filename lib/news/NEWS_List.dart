import 'package:flutter/material.dart';
import 'package:news_app_route/api_manager/api_services.dart';

import 'package:news_app_route/models/News.dart';

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
   int pageSize=10;
   bool lastPage=false;
   List<Articles>newsList=[];
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

 if(scrollController.position.atEdge&&
     scrollController.position.pixels!=0){
   if(lastPage==false){page++;setState(() {

   });}


 }


    });
  }
  @override



  void didUpdateWidget(  oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
     page=1;
     pageSize=10;
     lastPage=false;newsList=[];

  }
  @override
  Widget build(BuildContext context) {
print("page $page");


    return
      FutureBuilder(
      future: ApiServices.getNews(sourceId: widget.sourceId,

      page: page,
        pageSize: pageSize
      ),
          builder: (context,snapShot){
            if(snapShot.connectionState==ConnectionState.waiting&&newsList.isEmpty){
              return const loadingIndicitor();
            }else if(snapShot.hasError||snapShot.data!.status!='ok'){
              return const errorIndictor();
            } if((snapShot.data?.articles??[]).isNotEmpty){
              if(snapShot.data!.articles!.length <10){
                lastPage=true;
              }
              newsList.addAll(snapShot.data!.articles!);}
            else{
              lastPage=true;
              // final newsList=snapShot.data?.articles??[];

            }
            return  ListView.builder(
              controller:scrollController ,
              itemBuilder: (_,index){
                return newsItem(newsList[index]);
              },itemCount: newsList.length,);
          }




      );

      // builder: (context,snapShot){
      //  if(snapShot.connectionState==ConnectionState.waiting){
      //    return loadingIndicitor();
      //  }else if(snapShot.hasError||snapShot.data!.status!='ok'){
      //    return errorIndictor();
      //  }else{
      //    final newsList=snapShot.data?.articles??[];
      //    return  RefreshIndicator(
      //      onRefresh: ()async{
      //        setState(() {
      //
      //          page=1;
      //        });
      //      },
      //      child: ListView.builder(
      //        controller:scrollController ,
      //        itemBuilder: (_,index){
      //        return newsItem(newsList[index]);
      //      },itemCount: newsList.length,),
      //    );
      //  }
      // },
      //
      //  page: page.toString(),
       //  pageSize: pageSize



  }
}
