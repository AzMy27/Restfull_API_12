import 'package:flutter/material.dart';
import 'package:p12_restfull_api/simpan/job_listview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Job Portal'),
        ),
        body: const Center(
          child: JobsListView(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
