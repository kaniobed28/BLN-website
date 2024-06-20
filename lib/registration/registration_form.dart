import 'package:bln_website/firebase_options.dart';
import 'package:bln_website/registration/registration_form_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  
  // Define controllers for each text field
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController currentLocationController =
      TextEditingController();
  final TextEditingController foodAllergyController = TextEditingController();
  final TextEditingController whatsappNumberController =
      TextEditingController();
  final TextEditingController guardianNameController = TextEditingController();
  final TextEditingController guardianNumberController =
      TextEditingController();
  final TextEditingController guardianLocationController =
      TextEditingController();
  final TextEditingController relationshipToGuardianController =
      TextEditingController();
  final TextEditingController heardAboutSOMController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // Variable to hold the selected gender value
  String? selectedGender;

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    surnameController.dispose();
    firstNameController.dispose();
    currentLocationController.dispose();
    foodAllergyController.dispose();
    whatsappNumberController.dispose();
    guardianNameController.dispose();
    guardianNumberController.dispose();
    guardianLocationController.dispose();
    relationshipToGuardianController.dispose();
    heardAboutSOMController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RegistrationFormController registrationFormController =
        Get.put(RegistrationFormController());
    
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: surnameController,
                  decoration: const InputDecoration(border: OutlineInputBorder(),labelText: 'Surname'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your surname';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(border: OutlineInputBorder(),labelText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: selectedGender,
                  decoration: const InputDecoration(border: OutlineInputBorder(),labelText: 'Gender'),
                  items: const [
                    DropdownMenuItem(value: 'Male', child: Text('Male')),
                    DropdownMenuItem(value: 'Female', child: Text('Female')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: currentLocationController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder(),labelText: 'Current Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: foodAllergyController,
                  decoration: const InputDecoration(border: OutlineInputBorder(),labelText: 'Food Allergy'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: whatsappNumberController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder(),labelText: 'Whatsapp Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Whatsapp number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: guardianNameController,
                  decoration: const InputDecoration(border: OutlineInputBorder(),labelText: 'Guardian Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your guardian\'s name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: guardianNumberController,
                  decoration:
                      const InputDecoration(labelText: 'Guardian Number',
                      border: OutlineInputBorder(),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your guardian\'s number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: guardianLocationController,
                  decoration:
                      const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Guardian Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your guardian\'s location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  
                  controller: relationshipToGuardianController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                      labelText: 'Relationship to Guardian'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your relationship to the guardian';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: heardAboutSOMController,
                  decoration: const InputDecoration(border: OutlineInputBorder(),
                      labelText: 'How did you hear about SOM?'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter how you heard about SOM';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Access the values of the text fields using the controllers
                       registrationFormController.registerUser({
                        'surname': surnameController.text,
                        'firstName': firstNameController.text,
                        'gender': selectedGender,
                        'currentLocation': currentLocationController.text,
                        'foodAllergy': foodAllergyController.text,
                        'whatsappNumber': whatsappNumberController.text,
                        'guardianName': guardianNameController.text,
                        'guardianNumber': guardianNumberController.text,
                        'guardianLocation': guardianLocationController.text,
                        'relationshipToGuardian':
                            relationshipToGuardianController.text,
                        'heardAboutSOM': heardAboutSOMController.text,
                      });
                      Get.snackbar("Registration was successful", "Congratulations and See you at SOM 2024 ");

                     await Get.offAll(MainPage());

                      // Add your onPressed code here!
                    }
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Set the background color to black
                  
                ),
                  child: const Text('Register Now',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    home: RegisterForm(),
  ));
}
