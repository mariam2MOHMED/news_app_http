import 'package:flutter/material.dart';
import 'package:news_app_route/appTheme.dart';

class loadingIndicitor extends StatelessWidget {
  const loadingIndicitor({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}
