import 'dart:async';
import 'dart:convert';
import 'package:job_box/models/models.dart';
import 'package:http/http.dart' as http;

abstract class JobsRepository {
  Future<List<Jobs>> getJobs();
  Future<List<Jobs>> getAppliedJobs();
}

class JobRepositoryImpl extends JobsRepository {
  static const baseUrl = 'https://635cb272fc2595be264a8d03.mockapi.io/';
  @override
  Future<List<Jobs>> getJobs() async {
    var url = Uri.parse('$baseUrl/recentJobs');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Jobs> jobs =
          (data as List).map((job) => Jobs.fromJson(job)).toList();

      return jobs;
    } else {
      throw Exception('Failed');
    }
  }

  @override
  Future<List<Jobs>> getAppliedJobs() async {
    var url = Uri.parse('$baseUrl/appliedJobs');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Jobs> jobs =
          (data as List).map((job) => Jobs.fromJson(job)).toList();

      return jobs;
    } else {
      throw Exception('Failed');
    }
  }
}
