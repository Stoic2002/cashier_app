import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:cashier_app/core/extension/int_ext.dart';
import 'package:cashier_app/core/router/app_router.dart';
import 'package:cashier_app/core/router/route_constants.dart';
import 'package:cashier_app/features/home/data/models/category_model.dart';
import 'package:cashier_app/features/home/data/models/product_model.dart';
import 'package:cashier_app/features/order/presentation/bloc/checkout/checkout_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoryItemPage extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryItemPage({super.key, required this.categoryModel});

  @override
  State<CategoryItemPage> createState() => _CategoryItemPageState();
}

class _CategoryItemPageState extends State<CategoryItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.categoryModel.categoryName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 30),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Assets.images.background.provider(), fit: BoxFit.cover)),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 28,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisExtent: 293),
            itemCount: widget.categoryModel.productModel.length,
            itemBuilder: (BuildContext context, int index) {
              final ProductModel product =
                  widget.categoryModel.productModel[index];

              return GestureDetector(
                onTap: () {
                  context.pushNamed(
                    RouteConstants.productPath,
                    pathParameters: PathParameters().toMap(),
                    extra: product,
                  );
                },
                child: Container(
                    child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 135,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: AppColors.grey,
                      ),
                      child: product.image,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: double.infinity,
                      height: 42,
                      child: Text(
                        product.name,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 33,
                    ),
                    Container(
                      width: double.infinity,
                      height: 24,
                      child: Text(
                        product.price.currencyFormatRp,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.priceTag,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 35,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<CheckoutBloc>()
                              .add(AddProduct(product: product));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: 14,
                            ),
                            Text(
                              'Add to Bag',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(''),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                      ),
                    ),
                  ],
                )),
              );
            }),
      ),
    );
  }
}
