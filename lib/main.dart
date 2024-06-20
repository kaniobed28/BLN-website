import 'package:bln_website/description.dart';
import 'package:bln_website/firebase_options.dart';
import 'package:bln_website/registration/registration_form.dart';
import 'package:bln_website/registration/partner.dart';
import 'package:bln_website/vid.dart';
import 'package:bln_website/vocational.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double widthOfScreen = MediaQuery.of(context).size.width;
    final double heightOfScreen = MediaQuery.of(context).size.height;
    final Key videoKey = const Key('videoKey');

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FittedBox(
              child: Text(
                "SERMON ON THE MOUNT 2024",
                style:  TextStyle(fontSize:  100,fontWeight: FontWeight.bold),
              ),
            ),
            const SomDescription(),
            SizedBox(
              key: videoKey,
              width: widthOfScreen,
              height: heightOfScreen * 0.9,
              child:  VideoPlayerScreen(),
            ),
          ],
        ),
      ),
    );
  }
}



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/blnlogo.jpg"),
          ),
          SizedBox(width: 10),
          Text(
            'SOM 2024',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
      actions: screenWidth > 500
          ? [
              Tooltip(
                message: 'Home',
                child: TextButton.icon(
                  onPressed: () {
                    Get.offAll(MainPage());
                  },
                  icon: const Icon(Icons.home, color: Colors.black),
                  label: const Text('Home', style: TextStyle(color: Colors.black)),
                ),
              ),
              Tooltip(
                message: 'Register',
                child: TextButton.icon(
                  onPressed: () {
                    Get.offAll(const RegisterForm());
                  },
                  icon: const Icon(Icons.app_registration, color: Colors.black),
                  label: const Text('Register', style: TextStyle(color: Colors.black)),
                ),
              ),
              Tooltip(
                message: 'Vocation Training',
                child: TextButton.icon(
                  onPressed: () {
                    Get.offAll(const VocationalPage());
                  },
                  icon: const Icon(Icons.food_bank, color: Colors.black),
                  label: const Text('Vocation Training', style: TextStyle(color: Colors.black)),
                ),
              ),
              Tooltip(
                message: 'Partner',
                child: TextButton.icon(
                  onPressed: () {
                    Get.offAll(PartnershipForm());
                  },
                  icon: const Icon(Icons.handshake, color: Colors.black),
                  label: const Text('Partner', style: TextStyle(color: Colors.black)),
                ),
              ),
            ]
          : [
              PopupMenuButton<String>(
                onSelected: (String result) {
                  switch (result) {
                    case 'Home':
                      Get.offAll(MainPage());
                      break;
                    case 'Register':
                      Get.offAll(const RegisterForm());
                      break;
                    case 'Vocation Training':
                      Get.offAll(const VocationalPage());
                      break;
                    case 'Partner':
                      Get.offAll(PartnershipForm());
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Home',
                    child: ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Home'),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Register',
                    child: ListTile(
                      leading: Icon(Icons.app_registration),
                      title: Text('Register'),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Vocation Training',
                    child: ListTile(
                      leading: Icon(Icons.food_bank),
                      title: Text('Vocation Training'),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Partner',
                    child: ListTile(
                      leading: Icon(Icons.handshake),
                      title: Text('Partner'),
                    ),
                  ),
                ],
              ),
            ],
      backgroundColor: Colors.white,
      elevation: 2,
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
