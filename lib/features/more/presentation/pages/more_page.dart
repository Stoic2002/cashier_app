import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:cashier_app/features/auth/data/models/user_model.dart';
import 'package:cashier_app/features/more/presentation/bloc/profile/profile_bloc.dart';
import 'package:cashier_app/features/more/presentation/widget/more_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Assets.images.background.provider(), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, right: 10),
                  width: double.infinity,
                  child: Text(
                    'More',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                StreamBuilder(
                    stream: _firestore.collection('users').doc(uid).snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }
                      return Container(
                        padding: EdgeInsets.only(left: 15, right: 10),
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(
                                      snapshot.data!['name'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      snapshot.data!['phone'],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                MoreList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
