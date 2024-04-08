import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task1/services/verification_service.dart';

import 'dashboard.dart';

class Verification extends StatefulWidget {
  final String email;

  const Verification({super.key, required this.email});
  @override
  State<Verification> createState() => _VerificationState();


}

class _VerificationState extends State<Verification> {
  late List<int> verificationValues;
  late int verificationCode;

  @override
  void initState() {
    super.initState();
    verificationValues = List.filled(4, 0);
  }

  void updateVerificationCode() {
    String codeStr = verificationValues.join('');
    int cd = int.tryParse(codeStr) ?? 0;
    setState(() {
      verificationCode = cd; // Convert string to int
    });

    verifyCode(verificationCode);
  }

  verifyCode(int code) async{
    // updateVerificationCode();
    var response = await VerificationService().verify(widget.email, code);
    final data = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
    if(response.statusCode == 200){
      if(data['status']){
        //Navigate to dashboard
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      }
      else{
        showAlert(data['message']);
      }
    }
  }

  void showAlert(String msg){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(msg),
          // content: Text(
          //     msg,
          //     style: TextStyle(color: Colors.red)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 18, 0, 56),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Icon(
                  Icons.email,
                  size: 60,
                  color: Colors.white,
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'We have Sent Code Number to your email',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore \net dolore magna aliqua. Ut',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 4; i++)
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold
                              ),
                              decoration: InputDecoration(
                                counter: Offstage(),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                verificationValues[i] = int.tryParse(value) ?? 0;
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Haven't received email?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Send email again functionality
                      },
                      child: Text(
                        'Send Email Again',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 150),
                ElevatedButton.icon(
                  onPressed: () {
                    // Confirm button functionality
                    // verifyCode();
                    updateVerificationCode();
                  },

                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),

                  label: Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(
    home: Verification(email: '',),
  ));
}