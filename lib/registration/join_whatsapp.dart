import 'package:bln_website/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;


class JoinWhatsappScreen extends StatelessWidget {
  const JoinWhatsappScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/whatsapp-logo.png"),
            ),
            const Text('Join WhatsApp Group'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                              html.window.open('https://chat.whatsapp.com/EsgsTjetyD5KsI5u81U3Lf', 'new_tab');

              },
              child: const Text('Join Now'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Join',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JoinWhatsappScreen(),
    );
  }
}
