import 'package:bln_admin/firebase_options.dart';
import 'package:bln_admin/list_screen.dart';
import 'package:bln_admin/partners_list.dart';
import 'package:bln_admin/vocational_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List bodyWidgets = [
    CollectionListScreen(),
    VocationalListPage(),
    PartnersListPage(),
  ];
  @override
  Widget build(BuildContext context) {
     
    return GetMaterialApp(
      title: 'Registered List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Obx(()=>bodyWidgets[CustomBottomNavigationBar.rxIndex.value]),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  static final RxInt rxIndex = 0.obs;

  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      currentIndex: rxIndex.value,
      onTap: (index) {
        rxIndex.value = index;
      },
      items: const [
        BottomNavigationBarItem(label: "Registered", icon: Icon(Icons.app_registration)),
        BottomNavigationBarItem(label: "Vocational", icon: Icon(Icons.food_bank)),
        BottomNavigationBarItem(label: "Partners", icon: Icon(Icons.handshake)),
      ],
    ));
  }
}
