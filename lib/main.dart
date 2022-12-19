import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: false,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Workout Time',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
              bodyText2: TextStyle(color: Color.fromARGB(255, 66, 74, 95)),
            ),
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
