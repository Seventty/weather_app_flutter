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
              ...[252, 250, 247, 245, 242, 240, 237, 235, 232, 230].map(
                (alpha) => AppColors.secondaryBlack.withValues(alpha: alpha.toDouble()),
              ),
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
