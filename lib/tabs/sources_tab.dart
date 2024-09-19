import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_route/models/sources.dart';
import 'package:news_app_route/news/new_item.dart';
import 'package:news_app_route/tabs/tab_item.dart';

import '../news/NEWS_List.dart';

class sourcesTab extends StatefulWidget {
  const sourcesTab(this.sources,{super.key,});
final List<Sources>sources;
  @override
  State<sourcesTab> createState() => _sourcesTabState();
}

class _sourcesTabState extends State<sourcesTab> {
  int selectedIndex=0;

  
  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        SizedBox(height: 10.0,),
        DefaultTabController(
          length: widget.sources.length,

          child: TabBar(
              onTap: (index){
                selectedIndex=index;
                setState(() {

                });
              },
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorColor:Colors.transparent ,
              dividerColor: Colors.transparent,
              tabs: widget.sources.map((source) => tabItem(
                  isSelected:widget.sources.indexOf(source)
                      ==selectedIndex,
                  source:source.name?? "",
              )).toList()),
        ),
        Expanded(child: NewsList(widget.
        sources![selectedIndex].id??""))
      ],
    );
  }
}
