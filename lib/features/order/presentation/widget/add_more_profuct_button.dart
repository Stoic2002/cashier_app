import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AddMoreProductButton extends StatelessWidget {
  const AddMoreProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Add More product',
          style: TextStyle(color: AppColors.primary),
        ),
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            backgroundColor: AppColors.opacityGreen.withOpacity(0.14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
