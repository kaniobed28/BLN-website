import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VocationalCollectionController extends GetxController {
  var isLoading = true.obs;
  var collections = <Map<String, dynamic>>[].obs;

  VocationalCollectionController() {
    fetchCollections();
  }

  void fetchCollections() {
    FirebaseFirestore.instance.collection('vocational_collection').snapshots().listen((snapshot) {
      collections.value = snapshot.docs.map((doc) => {
        'id': doc.id,
        ...doc.data()
      }).toList();
      isLoading.value = false;
    });
  }

  void deleteCollection(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('vocational_collection').doc(docId).delete();
      collections.removeWhere((collection) => collection['id'] == docId);
    } catch (e) {
      print('Error deleting collection: $e');
    }
  }
}
