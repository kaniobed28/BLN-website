import 'package:bln_admin/list_contrller.dart';
import 'package:bln_admin/partners_controller.dart';
import 'package:bln_admin/vocation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnersListPage extends StatelessWidget {
  final PartnersController collectionController = Get.put(PartnersController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partners List'),
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
                      'Name: ${collection['fullName']}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Amount Promised: ${collection['partnershipAmount']}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Give Monthly: ${collection['giveMonthly']}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'WhatsApp Contact: ${collection['whatsappContact']}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Date Promised: ${collection['date']}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                   

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
