import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/personal_card_button.dart';

class PersonalCardScreen extends StatelessWidget {
  const PersonalCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final name = arguments?['name'];
    final phone = arguments?['phone'];
    final email = arguments?['email'];

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )),
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
              Text(
                name ?? '',
                style: const TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              PersonalCardButton(
                icon: Icons.phone,
                text: phone,
                onPressed: () => launchUrl(
                  Uri(
                    scheme: 'tel',
                    path: phone,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              PersonalCardButton(
                icon: Icons.email,
                text: email,
                onPressed: () => launchUrl(
                  Uri(
                    scheme: 'mailto',
                    path: email,
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
