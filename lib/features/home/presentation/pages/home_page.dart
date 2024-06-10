import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:cashier_app/core/router/app_router.dart';
import 'package:cashier_app/core/router/route_constants.dart';
import 'package:cashier_app/features/home/data/datasources/data_product.dart';
import 'package:cashier_app/features/home/presentation/widget/seacrh_product.dart';
import 'package:cashier_app/features/home/presentation/widget/user_location.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    itemCount: DataProduct().categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final category = DataProduct().categories[index];
                      return InkWell(
                        onTap: () {
                          context.goNamed(RouteConstants.categoriesPath,
                              pathParameters: PathParameters().toMap(),
                              extra: category);
                        },
                        child: Card(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: category.image,
                                ),
                                Text(
                                  category.categoryName,
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
