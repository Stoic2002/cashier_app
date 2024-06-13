import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:cashier_app/core/extension/int_ext.dart';
import 'package:cashier_app/features/home/data/models/quantity_model.dart';

import 'package:cashier_app/features/order/data/models/order_model.dart';
import 'package:cashier_app/features/order/presentation/bloc/bloc/order_bloc.dart';
import 'package:cashier_app/features/order/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:cashier_app/features/order/presentation/widget/add_more_profuct_button.dart';
import 'package:cashier_app/features/order/presentation/widget/change_location.dart';
import 'package:cashier_app/features/order/presentation/widget/payment_method.dart';
import 'package:cashier_app/features/order/presentation/widget/product_item.dart';
import 'package:cashier_app/features/order/presentation/widget/time_slot_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyBagPage extends StatefulWidget {
  const MyBagPage({super.key});

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  TextEditingController dateInput = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Assets.images.background.provider(), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 15, right: 10),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                child: Text(
                  'My Bag',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                height: 620,
                child: ListView(
                  children: [
                    Container(
                      child: Text(
                        'Products',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 350,
                      child: ProductItem(),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    AddMoreProductButton(),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Text(
                        'Expected Date & Time',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 52,
                      width: double.infinity,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "tanggal tidak boleh kosong";
                          } else {
                            return null;
                          }
                        },
                        controller: dateInput,
                        //editing controller of this TextField
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: 'Select Date',
                          filled: true,
                          fillColor: AppColors.grey,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8)),
                          suffixIcon: Icon(Icons.keyboard_arrow_down),
                          prefixIcon: Icon(Icons.calendar_today_outlined),
                          //icon of text field
                          //label text of field
                        ),
                        readOnly: true,
                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2024),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2025));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate = DateFormat(
                              'dd MMMM yyyy',
                            ).format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              dateInput.text = formattedDate;
                              //set output date to  TextField value.
                            });
                          } else {}
                        },
                      ),
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Container(
                      width: double.infinity,
                      child: Wrap(
                        spacing: 28,
                        runSpacing: 16,
                        children: [
                          TimeSlotContainer(
                            '8 AM - 11 AM',
                            isSelected: _selectedIndex == 0,
                            onTap: () => _handleTap(0),
                          ),
                          TimeSlotContainer(
                            '11 AM - 12 PM',
                            isSelected: _selectedIndex == 1,
                            onTap: () => _handleTap(1),
                          ),
                          TimeSlotContainer(
                            '12 PM - 2 PM',
                            isSelected: _selectedIndex == 2,
                            onTap: () => _handleTap(2),
                          ),
                          TimeSlotContainer(
                            '2 PM - 4 PM',
                            isSelected: _selectedIndex == 3,
                            onTap: () => _handleTap(3),
                          ),
                          TimeSlotContainer(
                            '4 PM - 6 PM',
                            isSelected: _selectedIndex == 4,
                            onTap: () => _handleTap(4),
                          ),
                          TimeSlotContainer(
                            '6 PM - 8 PM',
                            isSelected: _selectedIndex == 5,
                            onTap: () => _handleTap(5),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Delivery Location',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          child: Text(
                            'change',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ChangeLoc(),
                    SizedBox(
                      height: 47,
                    ),
                    Container(
                      width: double.infinity,
                      height: 103,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(fontSize: 15),
                              ),
                              BlocBuilder<CheckoutBloc, CheckoutState>(
                                builder: (context, state) {
                                  if (state is CheckoutLoaded) {
                                    final totalPrice = state.products.fold<int>(
                                        0,
                                        (previousValue, element) =>
                                            previousValue +
                                            (element.quantity *
                                                element.product.price!));
                                    return Text(
                                      totalPrice.currencyFormatRp,
                                      style: TextStyle(fontSize: 15),
                                    );
                                  }
                                  return Text('0');
                                },
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery Charge',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'BDT60',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'BDT3321',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    Container(
                      child: Text(
                        'Payment Method',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    PaymentMethod(),
                    SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<CheckoutBloc, CheckoutState>(
                        builder: (context, state) {
                      if (state is CheckoutFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Pembayaran Gagal')));
                      }
                      if (state is CheckoutLoaded) {
                        return Container(
                          height: 48,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (user != null) {
                                final uid = user!.uid;

                                context.read<OrderBloc>().add(OnOrder(
                                    userId: uid,
                                    transactionId:
                                        DateTime.now().millisecondsSinceEpoch,
                                    products: state.products));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Pembayaran Berhasil')));
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Text(
                                  'Place Order',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Icon(
                                  Icons.arrow_forward,
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
                        );
                      }

                      return Container();
                    }),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleTap(int index) {
    setState(() {
      if (_selectedIndex == index) {
        _selectedIndex = null;
      } else {
        _selectedIndex = index;
      }
    });
  }
}
