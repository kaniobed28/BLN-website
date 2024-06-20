import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class VocationalController extends GetxController {

  void registerForVocation(Map<String,dynamic> data)async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore.collection("vocational_collection").add(data);
  }
  
}