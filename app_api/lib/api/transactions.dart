import 'dart:convert';
import 'package:app_api/models/patients.dart';
import 'package:http/http.dart' as http; 

 
class Transactions {
  static const ROOT = '127.0.0.1:5000';
  static const _GET_ALL = '127.0.0.1:5000/getall';
  static const _ADD = '127.0.0.1:5000/add';
  static const _UPDATE = '127.0.0.1:5000/update';
  static const _DELETE = '127.0.0.1:5000/delete';
 
 
  static Future<List<Patients>> getPatients() async {
    try {

      final response = await http.post(_GET_ALL);
      print('getPatients Response: ${response.body}');
      if (200 == response.statusCode) {
        var parseResponse2 = parseResponse(response.body);
        List<Patients> list = parseResponse2;
        return list;
      } else {
        return List<Patients>();
      }
    } catch (e) {
      return List<Patients>(); // return an patientty list on exception/error
    }
  }
 
  static List<Patients> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    var map = parsed.map<Patients>((json) => Patients);
    return map.toList();
  }
 
  // Method to add Patients to the database...
  static Future<String> addPatients(String name) async {
    try {
      var map = Map<String, dynamic>();
      map['name'] = name;
      final response = await http.post(_ADD, body: map);
      print('addPatients Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
 
  // Method to update an Patients in Database...
  static Future<String> updatePatients(
      String patientId, String name) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE;
      map['patient_id'] = patientId;
      map['name'] = name;
      final response = await http.post(_UPDATE, body: map);
      print('updatePatients Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
 
  // Method to Delete an Patients from Database...
  static Future<String> deletePatients(String patientId) async {
    try {
      var map = Map<String, dynamic>();
      map['patient_id'] = patientId;
      final response = await http.post(_DELETE, body: map);
      print('deletePatients Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; // returning just an "error" string to keep this simple...
    }
  }
}