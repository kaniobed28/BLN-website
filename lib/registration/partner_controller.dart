import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PartnershipFormController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void addPartner(Map<String,dynamic> data) {
     firebaseFirestore.collection("partners").add(data);
  }
}