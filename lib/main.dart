import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task1/home.dart';
import 'package:task1/started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Splash Screen',
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      initialRoute: 'main',
      routes: {
        'home': (context) => const Home(),
        'started':(context) => const Started(),

      },
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 0, 56),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Image.asset('assets/splash_logo.png', height: 150, width: 150),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                child: Container(
                  margin: EdgeInsets.only(left:80),
                  child: Text(
                    '   Thynk Unlimited',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),),
              SizedBox(height: 30),
              Container(
                child: Text(
                  'Wait For Second..',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              SizedBox(height: 50),
              if (defaultTargetPlatform == TargetPlatform.iOS)
                const CupertinoActivityIndicator(
                  color: Colors.white,
                  radius: 20,
                )
              else
                const CircularProgressIndicator(
                  color: Colors.white,
                )
            ],
          ),
        ),
      ),
    );
  }
}


