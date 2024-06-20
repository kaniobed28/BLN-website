import 'package:bln_website/main.dart';
import 'package:bln_website/vocational_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VocationalPage extends StatefulWidget {
  const VocationalPage({super.key});

  @override
  State<VocationalPage> createState() => _VocationalPageState();
}

class _VocationalPageState extends State<VocationalPage> {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    VocationalController vocationalController = Get.put(VocationalController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FacilitatorComment(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      // width: 250, // Optional: Set width of the container
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 0, 0, 0), // Fill the container with blue color
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            8.0), // Optional: Add padding inside the container
                        child: Column(
                          children: [
                            Text(
                              'Registration Fees: 50 cedis. Ref. VT ',
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 255, 255, 255)),
                            ),
                            Text(
                              'Every payment should be made to our ministry lines: MTN MOMO 059875605 Joycelyn Mac-Andoh OR  TELECELCASH: 0502562131 (Joycelyn Mac-Andoh)',
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Participate Now"),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your e-mail';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                onPressed: () async{
                  if (formKey.currentState!.validate()) {
                    vocationalController.registerForVocation({"name":nameController.text.toString().trim(),
                    "email":emailController.text.toString().trim()

                    });
                    Get.snackbar("Vocational Training Registration was Successful", "Send your fees to the ministry account now. Thank You!.");
                    await Get.offAll(MainPage());
                    
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Set the background color to black
                  
                ),
                child: const Text('Register for Training',style: TextStyle(color: Colors.white),),
              )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FacilitatorComment extends StatelessWidget {
  const FacilitatorComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: Row(
          children: [
            //for image
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 300,
                minHeight: 300,
                maxWidth: 700,
                maxHeight: 700,
              ),
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/blnlogo.jpg"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            //text
            FittedBox(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 200, // Set the minimum height
                  maxWidth: 1000, // Set the maximum height
                ),
                child: Container(
                  // width: 250, // Optional: Set width of the container
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 0, 0, 0), // Fill the container with blue color
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(
                        8.0), // Optional: Add padding inside the container
                    child: Text(
                      'The Sermon on the Mount 2024 will feature a special vocational training for interested participants. This training will focus on equipping attendees with the skills needed to create delicious cakes, pastries, and fresh yogurt.',
                      style: TextStyle(fontSize: 50.0, color: Colors.white),
                      softWrap: true,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vocational Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VocationalPage(),
    );
  }
}

void main(List<String> args) {
  runApp(MyApp());
}
