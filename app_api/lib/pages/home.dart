import 'package:app_api/models/patients.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State {
  Future<Patients> patients;

  List<Patients> _patientsList;

  Future<Patients> fetchPatients() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');
    // List<Patients> patientList = [];

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return Patients.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    patients = fetchPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Column(
          children: <Widget>[
            FutureBuilder<Patients>(
              future: patients,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DataTable(
                    columns: [
                      DataColumn(
                        label: Text('id'),
                      ),
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('Address'),
                      ),
                      // Lets add one more column to show a delete button
                      DataColumn(
                        label: Text('Actions'),
                      )
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('id')),
                        DataCell(Text('name')),
                        DataCell(Text('address')),
                        DataCell(IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => null,
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('id')),
                        DataCell(Text('name')),
                        DataCell(Text('address')),
                        DataCell(IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => null,
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('id')),
                        DataCell(Text('name')),
                        DataCell(Text('address')),
                        DataCell(IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => null,
                        )),
                      ])
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return Column(children: <Widget>[
                  Text("Loading data..."),
                  CircularProgressIndicator(),
                ],);
              },
            )
          ],
        ));
  }
}
