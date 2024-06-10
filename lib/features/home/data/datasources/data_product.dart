import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:cashier_app/features/home/data/models/category_model.dart';
import 'package:cashier_app/features/home/data/models/product_model.dart';

class DataProduct {
  final List<CategoryModel> categories = [
    CategoryModel(
        categoryId: 1,
        categoryName: 'Fruit & Vegetables',
        image: Assets.images.fruits.image(),
        productModel: [
          ProductModel(
              id: 123,
              categoryId: 1,
              name: 'melon asjdasjsa sajdoasijdoas jdoiasjodajs',
              image: Assets.images.nido.image(),
              price: 2000,
              description:
                  'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
              stock: 10,
              isAvailable: 0,
              createdAt: DateTime(2024),
              updateAt: DateTime(2024)),
          ProductModel(
              id: 124,
              categoryId: 1,
              name: 'semangka sadasjjs dasjdoasj isajdoaj',
              image: Assets.images.nido.image(),
              price: 2000,
              description:
                  'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
              stock: 10,
              isAvailable: 0,
              createdAt: DateTime(2024),
              updateAt: DateTime(2024))
        ]),
    CategoryModel(
        categoryId: 2,
        categoryName: 'Breakfast',
        image: Assets.images.breakfast.image(),
        productModel: [
          ProductModel(
              id: 223,
              categoryId: 2,
              name: 'nasi ndog',
              image: Assets.images.dairy2.image(),
              price: 4000,
              description:
                  'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
              stock: 10,
              isAvailable: 0,
              createdAt: DateTime(2024),
              updateAt: DateTime(2024))
        ]),
    CategoryModel(
        categoryId: 3,
        categoryName: 'Beverages',
        image: Assets.images.beverages.image(),
        productModel: [
          ProductModel(
              id: 123,
              categoryId: 3,
              name: 'jus melon',
              image: Assets.images.dairy2.image(),
              price: 4000,
              description:
                  'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
              stock: 10,
              isAvailable: 0,
              createdAt: DateTime(2024),
              updateAt: DateTime(2024))
        ]),
    CategoryModel(
        categoryId: 4,
        categoryName: 'Meat & Fish',
        image: Assets.images.meat.image(),
        productModel: [
          ProductModel(
              id: 123,
              categoryId: 4,
              name: 'wagyu',
              image: Assets.images.dairy2.image(),
              price: 4000,
              description: 'test',
              stock: 10,
              isAvailable: 0,
              createdAt: DateTime(2024),
              updateAt: DateTime(2024))
        ]),
    CategoryModel(
        categoryId: 5,
        categoryName: 'Snacks',
        image: Assets.images.snacks.image(),
        productModel: [
          ProductModel(
            id: 123,
            categoryId: 5,
            name: 'Radhuni Shemai - 200 gm - 4-2-15-VD-SQ',
            image: Assets.images.radhuni.image(),
            price: 4000,
            description:
                'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
            stock: 10,
            isAvailable: 0,
            createdAt: DateTime(2024),
            updateAt: DateTime(2024),
          ),
          ProductModel(
              id: 124,
              categoryId: 5,
              name: 'Cheese Puffs Chips - 22 gm',
              image: Assets.images.chips.image(),
              price: 4000,
              description:
                  'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
              stock: 10,
              isAvailable: 0,
              createdAt: DateTime(2024),
              updateAt: DateTime(2024)),
          ProductModel(
              id: 125,
              categoryId: 5,
              name: 'Nescafe Classic Coffee Jar - 50gm',
              image: Assets.images.nescafe.image(),
              price: 4000,
              description:
                  'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
              stock: 10,
              isAvailable: 0,
              createdAt: DateTime(2024),
              updateAt: DateTime(2024)),
          ProductModel(
              id: 126,
              categoryId: 5,
              name: 'Akher Chini (Deshi Sugar) - 1kg',
              image: Assets.images.akher.image(),
              price: 4000,
              description:
                  'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
              stock: 10,
              isAvailable: 0,
              createdAt: DateTime(2024),
              updateAt: DateTime(2024))
        ]),
    CategoryModel(
        categoryId: 6,
        categoryName: 'dairy',
        image: Assets.images.dairy.image(),
        productModel: [
          ProductModel(
              id: 123,
              categoryId: 6,
              name: 'susu',
              image: Assets.images.dairy2.image(),
              price: 4000,
              description:
                  'Et quidem faciunt, ut summum bonum sit extremum et rationibus conquisitis de voluptate. Sed ut summum bonum sit id',
              stock: 10,
              isAvailable: 0,
              createdAt: DateTime(2024),
              updateAt: DateTime(2024))
        ])
  ];
}
