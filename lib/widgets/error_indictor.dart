import 'package:flutter/cupertino.dart';
import 'package:news_app_route/appTheme.dart';

class errorIndictor extends StatelessWidget {
  const errorIndictor({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Something went Wrong !",style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppTheme.primary
      ),),
    );
  }
}
