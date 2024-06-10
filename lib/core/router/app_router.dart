import 'package:cashier_app/core/router/route_constants.dart';
import 'package:cashier_app/features/auth/presentation/splash_screen_page.dart';
import 'package:cashier_app/features/home/data/models/category_model.dart';
import 'package:cashier_app/features/home/data/models/product_model.dart';
import 'package:cashier_app/features/home/presentation/pages/dashboard.dart';
import 'package:cashier_app/features/home/presentation/pages/category_item_page.dart';
import 'package:cashier_app/features/home/presentation/pages/detail_product_page.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

part 'enums/root_tab.dart';
part 'models/path_parameters.dart';

class AppRouter {
  final router = GoRouter(
      initialLocation: RouteConstants.splashPath,
      routes: [
        GoRoute(
          path: RouteConstants.splashPath,
          name: RouteConstants.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
            name: RouteConstants.root,
            path: RouteConstants.rootPath,
            builder: (context, state) {
              final tab =
                  int.tryParse(state.pathParameters[':root_tab'] ?? '') ?? 0;
              return Dashboard(
                key: state.pageKey,
                currentTab: tab,
              );
            },
            routes: [
              GoRoute(
                  path: RouteConstants.categoriesPath,
                  name: RouteConstants.categories,
                  builder: (context, state) {
                    CategoryModel model = state.extra as CategoryModel;

                    return CategoryItemPage(
                      categoryModel: model,
                    );
                  },
                  routes: []),
              GoRoute(
                path: RouteConstants.productPath,
                name: RouteConstants.product,
                builder: (context, state) {
                  ProductModel model = state.extra as ProductModel;

                  return DetailProductPage(
                    productModel: model,
                  );
                },
              )
            ])
      ],
      errorPageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: Center(
              child: Text(
                state.error.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      });
}
