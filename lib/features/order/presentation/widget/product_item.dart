import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:cashier_app/core/extension/int_ext.dart';
import 'package:cashier_app/features/order/data/order_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.orderProduct,
  });

  final List<OrderModel> orderProduct;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                orderProduct[index].price.currencyFormatRp,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.priceTag),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: InkWell(
                                      child: Icon(
                                        size: 14,
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text('10'),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(7)),
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
        });
  }
}
