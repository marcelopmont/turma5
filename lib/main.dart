// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
                radius: 100,
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'Marcelo Montanher',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              MyButton(
                icon: Icons.phone,
                text: '+55 11 99999-9999',
                onPressed: () => launchUrl(
                  Uri(
                    scheme: 'tel',
                    path: '+5511999999999',
                  ),
                ),
              ),
              SizedBox(height: 16),
              MyButton(
                icon: Icons.email,
                text: 'teste@gmail.com',
                onPressed: () => launchUrl(
                  Uri(
                    scheme: 'mailto',
                    path: 'teste@gmail.com',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.icon = Icons.star,
    this.text,
    required this.onPressed,
  });

  final IconData icon;
  final String? text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100),
      elevation: 5,
      color: Color(0xFFFFFFFF),
      child: ListTile(
        onTap: onPressed,
        leading: Icon(
          icon,
          color: Colors.teal,
        ),
        title: Text(
          text ?? '',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
