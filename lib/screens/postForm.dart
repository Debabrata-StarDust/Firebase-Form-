import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_form/commone/appColor.dart';
import 'package:google_form/commone/appText.dart';
import 'package:google_form/commone/uitl.dart';
import 'package:google_form/screens/textFormField.dart';

class PostScreen extends StatefulWidget {
  PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _contactController = TextEditingController();

  final TextEditingController _linkinController = TextEditingController();

  final TextEditingController _feedbackController = TextEditingController();

  bool loading = false;

  // final firebase = FirebaseFirestore.instance.collection();
  final fireBaseRef = FirebaseDatabase.instance.ref('post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text(
            AppString.formUpdate,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Center(
                child: Text(
                  "Update Form to get more!",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: TextFormFeild(
                  hintTextName: "What do people call you?",
                  labelName: "Name",
                  nameController: _nameController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: TextFormFeild(
                  hintTextName: "Where you stay?",
                  labelName: "Address",
                  nameController: _addressController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: TextFormFeild(
                  hintTextName: "What do people call you?",
                  labelName: "Contact",
                  nameController: _contactController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: TextFormFeild(
                  hintTextName: "How People Connect You?",
                  labelName: "Linkin ",
                  nameController: _linkinController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: TextFormFeild(
                  hintTextName: "Do you like this form style?",
                  labelName: "Feedback",
                  nameController: _feedbackController,
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  fireBaseRef
                      .child(DateTime.now().millisecondsSinceEpoch.toString())
                      .set({
                    'id': DateTime.now().millisecondsSinceEpoch.toString(),
                    "name": _nameController.text.toString(),
                    "address": _addressController.text.toString(),
                    "contact": _contactController.text.toString(),
                    "feedback": _feedbackController.text.toString()
                  }).then((value) {
                    setState(() {
                      loading = false;
                    });
                    Utils().tostMessage("Thank you for Updated your form!");
                  }).onError((error, stackTrace) {
                    Utils().tostMessage(error.toString());
                    setState(() {
                      loading = false;
                    });
                  });
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kPrimaryColor,
                  ),
                  child: Center(
                      child: loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Submit Now',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                ),
              )
            ],
          ),
        ));
  }
}
