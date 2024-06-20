import 'package:bln_website/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'partner_controller.dart';

class PartnershipForm extends StatelessWidget {
  final PartnershipFormController partnershipFormController =
      Get.put(PartnershipFormController());
  final formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _giveMonthlyController = TextEditingController();
  final TextEditingController _patAmntlyController = TextEditingController();

  PartnershipForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(border: OutlineInputBorder(),labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: _whatsappController,
                decoration:
                    const InputDecoration(border: OutlineInputBorder(),labelText: 'WhatsApp Contact'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your WhatsApp contact';
                  }
                  // Regex for validating a phone number
                  String pattern = r'^\+?[0-9]\d{1,14}$';
                  RegExp regExp = RegExp(pattern);
                  if (!regExp.hasMatch(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Obx(
              //   () =>
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                    labelText: 'Would you like to give on a monthly basis?'),
                items: ['Yes', 'No']
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) {
                  _giveMonthlyController.text = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  }
                  return null;
                },
                // )
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _patAmntlyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                    labelText: 'Partnership Amount (GH Cedis)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the partnership amount';
                  }
                  // Regex for validating money amounts (allows optional decimals)
                  String pattern = r'^\d+(\.\d{1,2})?$';
                  RegExp regExp = RegExp(pattern);
                  if (!regExp.hasMatch(value)) {
                    return 'Please enter a valid amount (e.g., 123 or 123.45)';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    partnershipFormController.addPartner({
                      'fullName': _fullNameController.text,
                      'whatsappContact': _whatsappController.text,
                      'giveMonthly': _giveMonthlyController.text,
                      'partnershipAmount': _patAmntlyController.text,
                      'date':DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now()),
                    });
                  Get.snackbar("Partnership Request Sent", "You can send partnership money to the ministry account now. Thank You!");
                  Get.offAll(()=>MainPage());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Set the background color to black
                  
                ),
                child: const Text('Partner Now',style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please send the money to our ministry lines',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('MTN MOMO NUMBER: 059875605 (Joycelyn Mac-Andoh)'),
              const Text('TELECELCASH: 0502562131 (Joycelyn Mac-Andoh)'),
            ],
          ),
        ),
      ),
    );
  }
}
