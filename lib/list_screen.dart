import 'package:bln_admin/list_contrller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionListScreen extends StatelessWidget {
  final CollectionController collectionController = Get.put(CollectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered List'),
      ),
      body: Obx(() {
        if (collectionController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (collectionController.collections.isEmpty) {
          return const Center(child: Text('No Registered Person Found'));
        }

        return ListView.builder(
          itemCount: collectionController.collections.length,
          itemBuilder: (context, index) {
            final collection = collectionController.collections[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Surname: ${collection['surname']}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'First Name: ${collection['firstName']}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text('Gender: ${collection['gender']}'),
                    Text('Current Location: ${collection['currentLocation']}'),
                    Text('Food Allergy: ${collection['foodAllergy']}'),
                    Text('WhatsApp Number: ${collection['whatsappNumber']}',style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    Text('Guardian Name: ${collection['guardianName']}'),
                    Text('Guardian Number: ${collection['guardianNumber']}'),
                    Text('Guardian Location: ${collection['guardianLocation']}'),
                    Text('Relationship to Guardian: ${collection['relationshipToGuardian']}'),
                    Text((collection['isLeader'] != "null" ||collection['isLeader'] != null || collection['isLeader'] != "")?'Is a leader?: ${collection['isLeader']}':"Is a leader?: No",style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    Text('Church or Fellowship Name: ${collection['fellowshipName']}'),
                    Text('Heard About SOM: ${collection['heardAboutSOM']}'),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _confirmDelete(context, collection['id']);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  void _confirmDelete(BuildContext context, String docId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this person?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                collectionController.deleteCollection(docId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
