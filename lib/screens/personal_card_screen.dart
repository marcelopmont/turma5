import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/personal_card_button.dart';

class PersonalCardScreen extends StatelessWidget {
  const PersonalCardScreen({super.key});

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
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
                radius: 100,
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Marcelo Montanher',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              PersonalCardButton(
                icon: Icons.phone,
                text: '+55 11 99999-9999',
                onPressed: () => launchUrl(
                  Uri(
                    scheme: 'tel',
                    path: '+5511999999999',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              PersonalCardButton(
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