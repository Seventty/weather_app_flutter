// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:weather_app/config/app_colors.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.black,
              AppColors.secondaryBlack,
              AppColors.secondaryBlack.withOpacity(0.98),
              AppColors.secondaryBlack.withOpacity(0.96),
              AppColors.secondaryBlack.withOpacity(0.94),
              AppColors.secondaryBlack.withOpacity(0.92),
              AppColors.secondaryBlack.withOpacity(0.90),
              AppColors.secondaryBlack.withOpacity(0.88),
              AppColors.secondaryBlack.withOpacity(0.86),
              AppColors.secondaryBlack.withOpacity(0.84),
              AppColors.secondaryBlack.withOpacity(0.82),
              AppColors.secondaryBlack.withOpacity(0.80),
              AppColors.darkBlue,
              AppColors.accentBlue,
              AppColors.lightBlue,
            ],
          ),
        ),

        child: Padding(
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 36.0),
          child: CustomScrollView(
            slivers: [SliverList(delegate: SliverChildListDelegate(children))],
          ),
        ),
      ),
    );
  }
}
