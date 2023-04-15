import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_form/commone/appColor.dart';
import 'package:google_form/commone/appText.dart';
import 'package:google_form/commone/uitl.dart';
import 'package:google_form/screens/pdfScreen.dart';
import 'package:google_form/screens/postForm.dart';
import 'package:google_form/screens/textFormField.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final firebase = FirebaseFirestore.instance.collection();
  final ref = FirebaseDatabase.instance.ref('post');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Forms"),
        ),
        body: Column(
          children: [
            Expanded(
                child: FirebaseAnimatedList(
                    query: ref,
                    itemBuilder: (context, snapshot, animation, index) {
                      return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)),
                          child: ListTile(
                            title:
                                Text(snapshot.child('name').value.toString()),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.child('id').value.toString()),
                                Text(
                                    snapshot.child('address').value.toString()),
                                Text(
                                    snapshot.child('contact').value.toString()),
                                Text(snapshot
                                    .child('feedback')
                                    .value
                                    .toString()),
                              ],
                            ),
                            trailing: TextButton(
                              onPressed: () {
                                //pdfGenerate();
                              },
                              child: const Text(
                                "Download PDF",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                          ));

                      // ListTile(
                      //   title: Text(snapshot.child('id').value.toString()),
                      // );
                    }))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(PostScreen());
          },
          child: const Icon(CupertinoIcons.add),
        ),
      ),
    );
  }
}
