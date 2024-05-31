import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 85,
        decoration: BoxDecoration(
          color: AppColors.opacityGreen.withOpacity(0.14),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.attach_money_outlined,
                size: 23,
                color: Colors.white,
              ),
            ),
            Container(
              width: 225,
              height: 41,
              child: Text(
                'Tap Here to select your payment method',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
