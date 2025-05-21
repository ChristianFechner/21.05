import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen2.dart';


void main() {
  runApp(const MainApp());
}



class MainApp extends StatelessWidget {
 const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("./assets/images/Logo.png")),
            SizedBox(height: 512),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen2()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2E7BED),
                padding: EdgeInsets.only(top: 16, left: 40, right: 40, bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                "Start",
                style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Roboto", fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

