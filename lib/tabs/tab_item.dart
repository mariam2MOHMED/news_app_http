import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_route/appTheme.dart';

class tabItem extends StatelessWidget {
  final bool isSelected;
  final String source;
  const tabItem({super.key,required this.isSelected,required this.source });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.primary,width: 3
        ),
        borderRadius: BorderRadius.circular(15),
        color: isSelected==true?AppTheme.primary:AppTheme.white
      ),
      child: Text(source,style: Theme.of(context).textTheme.titleSmall!.copyWith(
        color:isSelected==true? AppTheme.white
  :AppTheme.primary    ),),
    );
  }
}
