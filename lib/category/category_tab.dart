import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_route/appTheme.dart';
import 'package:news_app_route/category/category.dart';

import '../model/category_model.dart';

class categoryGrid extends StatelessWidget {

  final void Function(categoryModel) onCategorySelected;
  const categoryGrid({required this.onCategorySelected});
  @override
  Widget build(BuildContext context) {
    List<categoryModel>categories=[
      categoryModel(
          id:"sports",title: 'Sport', image: "assets/ball.png",
          bgColor: AppTheme.red),
      categoryModel(
          id:"general",
          title: 'Politics', image: "assets/Politics.png",
          bgColor: AppTheme.blue)
      , categoryModel(
          id:"health",
          title: 'Health', image: "assets/health.png",
          bgColor: AppTheme.pink),
      categoryModel(
          id:"business",
          title: 'Business', image: "assets/bussines.png",
          bgColor: AppTheme.brown),
      categoryModel(
          id:"entertainment",
          title: 'Entertainment', image: "assets/environment.png",
          bgColor: AppTheme.lightblue),
      categoryModel(
          id:"science",
          title: 'Science', image: "assets/science.png",
          bgColor: AppTheme.yellow),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24,),
          Text("Pick your category\nof interest",style:
          Theme.of(context).textTheme.titleLarge,),
          SizedBox(height: 24,),
          Expanded(
            child: GridView.builder(gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ,mainAxisSpacing: 24,
              crossAxisSpacing: 24
            ),
                itemCount: categories.length,
                itemBuilder: (context,index){
              final category=categories[index];
              return InkWell(
                onTap: ()=>onCategorySelected(category),
                child: categoryItem(index: index,
                    category: category),
              );
                }
                 ),
          )
        ],
      ),
    );
  }
}
