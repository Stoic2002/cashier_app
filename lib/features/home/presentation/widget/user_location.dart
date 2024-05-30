import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 45,
        width: 360,
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.location_on_outlined,
                size: 24,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                      width: 270,
                      child: Text(
                        'Your Location',
                        style: TextStyle(fontSize: 11),
                      )),
                  Container(
                    width: 270,
                    child: Text(
                      'Jln Letnan Karjono, No.155, Parakancanggah',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
