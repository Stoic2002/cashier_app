import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:cashier_app/features/home/data/models/category_model.dart';
import 'package:cashier_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:cashier_app/core/extension/int_ext.dart';

class DetailProductPage extends StatefulWidget {
  final ProductModel productModel;
  const DetailProductPage({super.key, required this.productModel});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Product Details',
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
            color: Colors.white,
            image: DecorationImage(
                image: Assets.images.background.provider(), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                width: 294,
                height: 308,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: Assets.images.dano2.provider(),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 60,
                child: Text(
                  widget.productModel.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                height: 44,
                child: Text(
                  widget.productModel.price.currencyFormatRp,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightGreen),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: 24,
                width: double.infinity,
                child: SizedBox(
                  height: 24,
                  width: 159,
                  child: Row(
                    children: [
                      Icon(
                        Icons.category_outlined,
                        size: 24,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        'Dairy Product',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 106,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      width: 24,
                      height: 106,
                      child: Icon(
                        Icons.description_outlined,
                        size: 24,
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Container(
                      width: 307,
                      height: 106,
                      child: Text(widget.productModel.description,
                          style: TextStyle(fontSize: 16)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(''),
                      Text(
                        'Add to Bag',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 24,
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
