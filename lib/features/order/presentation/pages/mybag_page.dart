import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:cashier_app/core/extension/int_ext.dart';
import 'package:cashier_app/features/order/data/order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyBagPage extends StatefulWidget {
  const MyBagPage({super.key});

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  final List<OrderModel> orderProduct = [
    OrderModel('Arla DANO Full Cream Milk Powder Instant', 1000),
    OrderModel('Nestle Nido Full Cream Milk Powder Instant', 2000),
    OrderModel('Cheese Puffs Chips - 22 gm', 4500)
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
          padding: const EdgeInsets.only(top: 40, left: 15, right: 10),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                child: Text(
                  'My Bag',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                height: 620,
                child: ListView(
                  children: [
                    Container(
                      child: Text(
                        'Products',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 350,
                      child: ListView.separated(
                          itemCount: orderProduct.length,
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              height: 163,
                              child: Row(
                                children: [
                                  Container(
                                    width: 115,
                                    height: 121,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Assets.images.dano.image(),
                                  ),
                                  Container(
                                    width: 250,
                                    height: 120,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 203,
                                          height: 60,
                                          child: Text(
                                            orderProduct[index].nama,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        Container(
                                          width: 203,
                                          height: 60,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Text(
                                                  orderProduct[index]
                                                      .price
                                                      .currencyFormatRp,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          AppColors.priceTag),
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 35,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                      ),
                                                      child: InkWell(
                                                        child: Icon(
                                                          size: 14,
                                                          Icons.remove,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Text('1'),
                                                    Container(
                                                      width: 35,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7)),
                                                      child: InkWell(
                                                        child: Icon(
                                                          size: 14,
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
