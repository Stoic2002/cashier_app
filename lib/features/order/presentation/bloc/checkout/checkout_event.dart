part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutEvent {}

class AddProduct extends CheckoutEvent {
  final ProductModel product;

  AddProduct({required this.product});
}

class RemoveProduct extends CheckoutEvent {
  final ProductModel product;

  RemoveProduct({required this.product});
}
