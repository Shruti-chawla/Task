import 'package:flutter/material.dart';
import 'package:task1/register.dart';
import 'package:task1/started.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ),
);
class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 18, 0, 56),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // physics: BouncingScrollPhysics(), // Use BouncingScrollPhysics for a more natural scrolling effect
            child: ConstrainedBox( // Add ConstrainedBox to ensure scrolling works properly
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height, // Set minimum height to ensure proper scrolling
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Image.asset('assets/splash_logo.png', height: 150, width: 150),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        child: Container(
                          margin: EdgeInsets.only(left: 45),
                          child: Text(
                            '   Thynk Unlimited',
                            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 70),
                    Expanded(
                      child: Container(
                        width: 380,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 20),
                              Container(
                                child: Text(
                                  'Welcome',
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 18, 0, 56)),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(30),
                                child: Center(
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut',
                                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 18, 0, 56)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                height: 40,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.white,
                                  border: Border.all(color: Color.fromARGB(255, 18, 0, 56)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Started()), // Navigate to Started page
                                    );
                                  },
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Get Started",
                                          style: TextStyle(color: Color.fromARGB(255, 18, 0, 56)),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                          color: Color.fromARGB(255, 18, 0, 56),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 50),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        color: Colors.orange,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        color: Colors.orange,
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Register()), // Navigate to Register page
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.orange, // background color
                                          onPrimary: Colors.white, // text color
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(35),
                                          ),
                                        ),
                                        child: Text(
                                          "Register",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}