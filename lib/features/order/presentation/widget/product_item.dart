import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:cashier_app/core/components/circle_loading.dart';
import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:cashier_app/core/extension/int_ext.dart';
import 'package:cashier_app/features/home/data/models/product_model.dart';
import 'package:cashier_app/features/order/data/order_model.dart';
import 'package:cashier_app/features/order/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.orderProduct,
  });

  final List<OrderModel> orderProduct;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutLoading) {
          return const CircleLoading();
        }
        if (state is CheckoutFailure) {
          return Text(state.message);
        }
        if (state is CheckoutLoaded) {
          return ListView.separated(
              itemCount: state.products.length,
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
                                state.products[index].product.name,
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
                                      state.products[index].product.price
                                          .currencyFormatRp,
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
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              context.read<CheckoutBloc>().add(
                                                  RemoveProduct(
                                                      product: state
                                                          .products[index]
                                                          .product));
                                            },
                                            child: Icon(
                                              size: 14,
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text(state.products[index].quantity
                                            .toString()),
                                        Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: InkWell(
                                            onTap: () {
                                              context.read<CheckoutBloc>().add(
                                                  AddProduct(
                                                      product: state
                                                          .products[index]
                                                          .product));
                                            },
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
        return SizedBox();
      },
    );
  }
}
