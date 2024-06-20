import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double widthOfScreen = MediaQuery.of(context).size.width;
    final double heightOfScreen = MediaQuery.of(context).size.height;
    final Key videoKey = Key('videoKey');

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FittedBox(
              child: Text(
                "Sermon On the Mount 2024",
                style: GoogleFonts.zeyada(fontSize: 100),
              ),
            ),
            const SomDescription(),
            SizedBox(
              key: videoKey,
              width: widthOfScreen,
              height: heightOfScreen * 0.9,
              child: const VideoCard(),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}

class RegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Registration Form Content'),
      ),
    );
  }
}

class PartnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Partner Page Content'),
      ),
    );
  }
}



class SomDescription extends StatelessWidget {
  const SomDescription();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'This is the description of the Sermon on the Mount 2024 event.',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  const VideoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          'Video Content Here',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
