import 'package:flutter/material.dart';
import 'package:refugee_dashboard/theme/app_colors.dart';

class RefugeeLoading extends StatelessWidget {
  const RefugeeLoading({super.key, this.strokeWidth = 4.0});
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive();
  }
}

class RefugeeLinearLoading extends StatelessWidget {
  const RefugeeLinearLoading({super.key, this.strokeWidth = 2.0});
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: AppColors.primary,
      minHeight: strokeWidth,
    );
  }
}
