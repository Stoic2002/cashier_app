import 'package:cashier_app/core/router/app_router.dart';
import 'package:cashier_app/features/auth/data/datasource/auth_method.dart';
import 'package:cashier_app/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:cashier_app/features/order/data/datasources/order_datasource.dart';
import 'package:cashier_app/features/order/presentation/bloc/bloc/order_bloc.dart';
import 'package:cashier_app/features/order/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:cashier_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(OrderDatasource()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(AuthMethod()),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
