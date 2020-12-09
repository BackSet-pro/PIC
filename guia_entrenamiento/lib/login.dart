import 'package:flutter/material.dart';

class loginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 200,
            ),
            TextFormField(decoration: InputDecoration(hintText: 'Usuario')),
            TextFormField(
              decoration: InputDecoration(hintText: 'Contraseña'),
              obscureText: true,
            )
          ],
        ),
      ),
    );
  }
}
