import 'package:cashier_app/features/order/data/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future order(OrderModel orderRequestModel) async {
    try {
      final orderData = orderRequestModel.toJson();
      final orderId = await _firestore.collection('orders').add(orderData);
      return orderId.id;
    } catch (e) {
      return 'Error: $e';
    }
  }
}
