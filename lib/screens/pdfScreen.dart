import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> pdfGenerate() async {
  final pdfRef = FirebaseDatabase.instance.ref('post');
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        children: [
          pw.Header(
            level: 0,
            text: 'My Data',
          ),
          pw.Table.fromTextArray(
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            data: [
              ['Name', 'Age'],
              ...data.map((e) => [e['name'], e['age'].toString()]),
            ],
          ),
        ],
      ),
    ),
  );

  final file = File('example.pdf');
}
