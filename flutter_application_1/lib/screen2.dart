import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen3.dart';
import 'package:flutter_application_1/screen4.dart';
// Make sure that screen4.dart exists and contains a class named Screen4

class Screen2 extends StatelessWidget {
  // Attribute
  // (keine)

  // Konstruktor
  const Screen2({super.key});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7AB2FF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("./assets/images/Logo.png"),
            SizedBox(height: 96),
            Image.asset("./assets/images/Login.png"),
            SizedBox(height: 32),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateUsername,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
                hintText: 'Username',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                hintText: "Email",
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validatePassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                hintText: "Password",
              ),
            ),            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen3()),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  child: Text("Passwort vergessen?"),
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen4()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2E7BED),
                padding: EdgeInsets.only(
                  top: 16,
                  left: 40,
                  right: 40,
                  bottom: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                "Weiter",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 64),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen3()),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                ),
              ),
              child: Text("Registrieren?"),
            ),
          ],
        ),
      ),
    );
  }

  String? validateUsername(String? userInput) {
    if (userInput == null || userInput.isEmpty) {
      return 'Bitte geben Sie einen Benutzernamen ein';
    }
    if (userInput.length < 3) {
      return "Mindestens 3 Buchstaben";
    }
    if (userInput.length >= 21) {
      return "Maximal 20 Buchstaben";
    }
    if (userInput.contains(" ")) {
      return "Keine Leerzeichen erlaubt";
    }

    String abc = "abcdefghijklmnopqrstuvwxyz";
    String abcUpper = abc.toUpperCase();
    String abcLowerUpper = abc + abcUpper;

    if (!abcLowerUpper.contains(userInput[0])) {
      return "Muss mit Buchstabe beginnen";
    }

    String umlauts = "äüößÄÜÖ";

    for (int i = 0; i < userInput.length; i++) {
      final String letter = userInput[i];
      if (umlauts.contains(letter)) {
        return "Darf keine Sonderzeichen beinhalten";
      }
    }

    return null; // Validierung erfolgreich
    // Hier können Sie null zurückgeben, wenn die Validierung erfolgreich ist
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bitte eine E-Mail-Adresse eingeben';
    }
    // Überprüfen, ob die E-Mail-Adresse ein gültiges Format hat
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Bitte eine gültige E-Mail-Adresse eingeben';
    }
    return null; // E-Mail ist gültig
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bitte Passwort eingeben';
    }
    if (value.length < 8) {
      return 'Das Passwort muss mindestens 8 Zeichen lang sein';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Das Passwort muss mindestens einen Kleinbuchstaben enthalten';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Das Passwort muss mindestens einen Großbuchstaben enthalten';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Das Passwort muss mindestens eine Zahl enthalten';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Das Passwort muss mindestens ein Sonderzeichen enthalten';
    }
    return null; // Das Passwort ist gültig
  }
}
