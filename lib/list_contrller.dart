import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionController extends GetxController {
  var isLoading = true.obs;
  var collections = <Map<String, dynamic>>[].obs;

  CollectionController() {
    fetchCollections();
  }

  void fetchCollections() {
    FirebaseFirestore.instance.collection('registered_users').snapshots().listen((snapshot) {
      collections.value = snapshot.docs.map((doc) => {
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>
      }).toList();
      isLoading.value = false;
    });
  }

  void deleteCollection(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('registered_users').doc(docId).delete();
      collections.removeWhere((collection) => collection['id'] == docId);
    } catch (e) {
      print('Error deleting collection: $e');
    }
  }
}
