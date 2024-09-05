import 'package:flutter/material.dart';
import 'package:news_app_route/appTheme.dart';
import 'package:news_app_route/category/category_tab.dart';
import 'package:news_app_route/category/category_detials.dart';
import 'package:news_app_route/drawer/drawer.dart';
import 'package:news_app_route/model/category_model.dart';
import 'package:news_app_route/search/search_delegte.dart';
import 'package:news_app_route/setting/setting_tab.dart';

class homeScreen extends StatefulWidget {
  static String routeName='/homeScreee';

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
  width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/pattern.png'))
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("NewsApp"),
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: searchTab());
            }, icon: Icon(
              Icons.search,color:
            AppTheme.white,
            size: 24,
            ))
          ],
        ),
        body:selectedCategory!=null ? categoryDetials(
       id:     selectedCategory!.id,
        ): drawerItem==DrawerItem.categories
            ? categoryGrid(
          onCategorySelected:onCategorySelected,
        ):const settingTab(),
        drawer: homeDrawer(onItemSelect:onDrawerItemSelected
           ),
      ),
    );
  }
  DrawerItem drawerItem=DrawerItem.categories;
  categoryModel? selectedCategory;
  void onCategorySelected(categoryModel category){
selectedCategory=category;setState(() {});
  }
  void onDrawerItemSelected(DrawerItem onSelectedItem){
    drawerItem=onSelectedItem;
    setState(() {

    });
    Navigator.of(context).pop();
    selectedCategory=null;
  }

}
