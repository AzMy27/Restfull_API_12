import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'job.dart';

class JobsListView extends StatelessWidget {
  const JobsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Job>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Job>? data = snapshot.data;
          return _jobsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Future<List<Job>> _fetchJobs() async {
    var uri = Uri.parse('https://mock-json-service.glitch.me');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _jobsListView(data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tile(
            context, data[index].position, data[index].company, Icons.work);
      },
    );
  }

  ListTile _tile(
          BuildContext context, String title, String subtitle, IconData icon) =>
      ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
        onTap: () {
          final snackBar = SnackBar(
            duration: const Duration(seconds: 1),
            content: Text("Anda memilih $title!"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      );
}
