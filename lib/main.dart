import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: CustomRectClipper(),
          child: Container(
            height: 500,
            width: 320,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              color: Colors.grey,
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "RoundedDiagonalPathClipper()",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "RoundedDiagonalPathClipper()",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "RoundedDiagonalPathClipper()",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomRectClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path()
      ..lineTo(0.0, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..quadraticBezierTo(size.width - 50, 0.0, size.width - 60.0, -5.0)
      ..lineTo(40.0, 150.0) // here you adjust the value as much as you nee
      ..quadraticBezierTo(0.0, 180.0, 0.0, 220.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
