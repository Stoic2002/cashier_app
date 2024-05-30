import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<Map<String, dynamic>> categories = [
    {
      'image': Assets.images.fruits2.image(),
      'title': 'Fruits & Vegetables',
    },
    {
      'image': Assets.images.breakfast2.image(),
      'title': 'Breakfast',
    },
    {
      'image': Assets.images.beverages2.image(),
      'title': 'Beverages',
    },
    {
      'image': Assets.images.meat2.image(),
      'title': 'Meat & Fish',
    },
    {
      'image': Assets.images.snacks2.image(),
      'title': 'Snacks',
    },
    {
      'image': Assets.images.dairy2.image(),
      'title': 'Dairy',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Assets.images.background.provider(), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10, top: 40),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  'Category',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 630,
                padding: EdgeInsets.only(top: 15),
                width: double.infinity,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 28,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
