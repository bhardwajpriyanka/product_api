import 'package:flutter/material.dart';
import 'package:product_api/screen/home/provider/home_provider.dart';
import 'package:product_api/screen/home/view/home_screen.dart';
import 'package:product_api/screen/product/view/product_screen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) =>product_screen(),
          'data':(context) => data_screen(),
        },
      ),
    ),
  );
}
