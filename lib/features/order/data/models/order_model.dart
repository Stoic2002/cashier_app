import 'package:cashier_app/features/order/data/models/products_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final int? transactionId;
  final String userId;
  final int? subtotal;

  final List<ProductsModel> products;

  OrderModel(
      {required this.transactionId,
      required this.subtotal,
      required this.products,
      required this.userId});

  static OrderModel fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return OrderModel(
      userId: snapshot['userId'],
      transactionId: snapshot['transactionId'],
      subtotal: snapshot['subTotal'],
      products: snapshot["products"] == null
          ? []
          : List<ProductsModel>.from(
              snapshot["products"]!.map((x) => ProductsModel.fromSnapshot(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "transactionId": transactionId,
        "subTotal": subtotal,
        "products": products == ""
            ? []
            : List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
