import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PartnersController extends GetxController {
  var isLoading = true.obs;
  var collections = <Map<String, dynamic>>[].obs;

  PartnersController() {
    fetchCollections();
  }

  void fetchCollections() {
    FirebaseFirestore.instance.collection('partners').snapshots().listen((snapshot) {
      collections.value = snapshot.docs.map((doc) => {
        'id': doc.id,
        ...doc.data()
      }).toList();
      isLoading.value = false;
    });
  }

  void deleteCollection(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('partners').doc(docId).delete();
      collections.removeWhere((collection) => collection['id'] == docId);
    } catch (e) {
      print('Error deleting collection: $e');
    }
  }
}
