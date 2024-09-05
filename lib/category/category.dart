import 'package:flutter/cupertino.dart';
import 'package:news_app_route/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:news_app_route/model/category_model.dart';
class categoryItem extends StatelessWidget {
  final int index;
  final categoryModel category;
  const categoryItem({

    required this.index,
    required this.category,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:148 ,
      height: 171,
      decoration: BoxDecoration(
        color: category.bgColor,
        borderRadius: BorderRadiusDirectional.only(
topStart: Radius.circular(25),
            topEnd: Radius.circular(25),
            bottomStart: Radius.circular(index.isEven?25:0),
            bottomEnd:  Radius.circular(index.isOdd?25:0),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("${category.image}",height: 100,),
          Text("${category.title}",
            style: Theme.of(context).textTheme.titleMedium,)
        ],
      ),
    );
  }
}
