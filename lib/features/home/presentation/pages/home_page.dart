import 'package:cashier_app/core/assets/assets.gen.dart';

import 'package:cashier_app/features/home/presentation/widget/seacrh_product.dart';
import 'package:cashier_app/features/home/presentation/widget/user_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> categories = [
    {
      'image': Assets.images.fruits.image(),
      'title': 'Fruits & Vegetables',
    },
    {
      'image': Assets.images.breakfast.image(),
      'title': 'Breakfast',
    },
    {
      'image': Assets.images.beverages.image(),
      'title': 'Beverages',
    },
    {
      'image': Assets.images.meat.image(),
      'title': 'Meat & Fish',
    },
    {
      'image': Assets.images.snacks.image(),
      'title': 'Snacks',
    },
    {
      'image': Assets.images.dairy.image(),
      'title': 'Dairy',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Assets.images.background.provider(), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10, top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grocery Plus',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Assets.icons.notificationsNone
                          .svg(width: 24, height: 24))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              UserLocation(),
              SizedBox(
                height: 24,
              ),
              SearchProduct(),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 25),
                height: 475,
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final category = categories[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: category['image'],
                                ),
                                Text(
                                  category['title'],
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            )),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
