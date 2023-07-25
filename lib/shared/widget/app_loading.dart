import 'package:flutter/material.dart';
import 'package:flutter_ar/utils/colors.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
