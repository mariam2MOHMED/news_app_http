import 'package:flutter/material.dart';
import 'package:news_app_route/appTheme.dart';

class homeDrawer extends StatelessWidget {

  final void Function(DrawerItem)onItemSelect;
  const homeDrawer({
    super.key,
    required this.onItemSelect
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.6 ,
      child: Column(
        children: [
          Container(
            color: AppTheme.primary,
            height: MediaQuery.of(context).size.height*0.2 ,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text("NewsApp!",
              style: Theme.of(context)
                  .textTheme.titleLarge!.copyWith(
              fontSize: 24,
              color: AppTheme.white
            ),
            ),
          ),
          Expanded(

            child: Container(
              padding: EdgeInsets.all(20),
              color: AppTheme.white,
              child: Column(
                children: [
                  //Settings
                  InkWell(
                    onTap: ()=>
                      onItemSelect(DrawerItem.categories )
                    ,
                    child:
                    Row(
                      children: [
                        Icon(Icons.list_sharp,color: AppTheme.black,size: 32,),
                        SizedBox(width: 5.0,),
                        Text("Categories",
                          style: Theme.of(context).textTheme.headlineLarge,)
                      ],
                    ),
                  ),
                  SizedBox(height: 24.0,),
                  InkWell(
                    onTap:()=>
                      onItemSelect(DrawerItem.setting  )
                     ,
                    child:
                    Row(
                      children: [
                        Icon(Icons.settings,color: AppTheme.black,size: 32,),
                        SizedBox(width: 5.0,),
                        Text("Setting",
                          style: Theme.of(context).textTheme.headlineLarge,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
enum DrawerItem{
  categories,
  setting;
}