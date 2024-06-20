import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RegistrationFormController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void registerUser(Map<String, dynamic> data) async {
    try {
      await firebaseFirestore.collection("registered_users").add(data);
      print("data added");
    } catch (e) {
      print(e);
    }
  }
}
