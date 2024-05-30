import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
      width: 360,
      height: 52,
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search Anything',
          hintStyle: TextStyle(color: Colors.grey[500]),
          contentPadding: EdgeInsets.only(),
          icon: Assets.icons.search.svg(),
        ),
      ),
    );
  }
}
