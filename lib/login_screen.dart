import 'package:flutter/material.dart';
import 'package:tugas1_biodata/biodata_screen.dart';
import 'package:tugas1_biodata/widget/auth_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/login-image.png'),
            const Column(
              children: [
                Text(
                  'Selamat Datang',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  'Selamat datang di aplikasi Aplikasi Widya Edu \n'
                  'Aplikasi Latihan dan Konsultasi Soal',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const Column(
              children: [
                AuthButton(
                  iconPath: 'assets/google-logo.png',
                  text: 'Masuk dengan Google',
                  color: Colors.white,
                  textColor: Colors.black,
                  destination: BiodataScreen(),
                ),
                SizedBox(
                  height: 16,
                ),
                AuthButton(
                  iconPath: 'assets/apple-logo.png',
                  text: 'Masuk dengan Apple',
                  color: Colors.black,
                  textColor: Colors.white,
                  destination: BiodataScreen(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}