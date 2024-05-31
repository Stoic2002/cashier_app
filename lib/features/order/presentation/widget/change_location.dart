import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ChangeLoc extends StatelessWidget {
  const ChangeLoc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 45,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                  color: AppColors.changeLoc.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.location_on_outlined,
                size: 23,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                width: 300,
                child: Text(
                  'Jln Letnan Karjono, No.155, Parakancanggah',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
