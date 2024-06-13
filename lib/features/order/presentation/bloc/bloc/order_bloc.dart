import 'package:bloc/bloc.dart';
import 'package:cashier_app/features/home/data/models/quantity_model.dart';
import 'package:cashier_app/features/order/data/datasources/order_datasource.dart';
import 'package:cashier_app/features/order/data/models/order_model.dart';
import 'package:cashier_app/features/order/data/models/products_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderDatasource _datasource;
  OrderBloc(this._datasource) : super(OrderInitial()) {
    on<OnOrder>((event, emit) async {
      // TODO: implement event
      emit(OrderLoading());
      int subTotal = 0;
      for (var product in event.products) {
        subTotal += product.product.price * product.quantity;
      }

      final orderRequestData = OrderModel(
          userId: event.userId,
          transactionId: event.transactionId,
          subtotal: subTotal,
          products: event.products
              .map(
                (e) => ProductsModel(
                  productId: e.product.id,
                  productName: e.product.name,
                  productPrice: e.product.price,
                  quantity: e.quantity,
                ),
              )
              .toList());
      final result = await _datasource.order(orderRequestData);

      if (result is String) {
        // Terjadi error
        emit(OrderFailure(message: result));
      } else {
        // Sukses
        emit(OrderLoaded(orderModel: result));
      }
    });
  }
}
