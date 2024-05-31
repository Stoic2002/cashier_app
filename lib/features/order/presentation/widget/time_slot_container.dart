import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TimeSlotContainer extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  TimeSlotContainer(
    this.text, {
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 52,
        width: 103,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(9),
          border: isSelected
              ? Border.all(color: AppColors.primary, width: 2.0)
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 12,
              color: isSelected ? AppColors.primary : Colors.black),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class TimeSlotContainer extends StatelessWidget {
//   final String text;
//   final bool isSelected;

//   TimeSlotContainer(this.text, {this.isSelected = false});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       height: 52,
//       width: 103,
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.green : Colors.grey[300],
//         borderRadius: BorderRadius.circular(9),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 12,
//           color: isSelected ? Colors.white : Colors.black,
//         ),
//       ),
//     );
//   }
// }
