import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_route/api_manager/api_services.dart';
import 'package:news_app_route/news/new_item.dart';
import 'package:news_app_route/tabs/sources_tab.dart';
import 'package:news_app_route/tabs/tab_item.dart';
import 'package:news_app_route/widgets/error_indictor.dart';
import 'package:news_app_route/widgets/loading_indicitor.dart';

import '../models/sources.dart';
class categoryDetials extends StatefulWidget {
  final String id;
  const categoryDetials({required this.id});

  @override
  State<categoryDetials> createState() => _categoryDetialsState();
}

class _categoryDetialsState extends State<categoryDetials> {



  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future:   ApiServices.getSources(widget.id),
      builder: (context,snapShot){
        if(snapShot.connectionState==ConnectionState.waiting){
          return loadingIndicitor();
        }else if(snapShot.hasError   ||snapShot.data!.status!='ok'){
          return errorIndictor();
        }else{
          final   sources = snapShot.data?.sources??[];
          return  sourcesTab(sources);

        }
      },


    );
  }
}
