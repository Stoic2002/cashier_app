import 'package:cashier_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final int categoryId;
  final String categoryName;
  final Image image;
  final List<ProductModel> productModel;

  CategoryModel(
      {required this.categoryId,
      required this.categoryName,
      required this.image,
      required this.productModel});
}
