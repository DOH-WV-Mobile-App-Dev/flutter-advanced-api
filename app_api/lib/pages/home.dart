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
        await http.get('http://172.16.3.189:5000/patients?limit=30');
    // List<Patients> patientList = [];

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      var data = json.decode(response.body);
      List<Patients> patientsList = [];
      for (var p in data) {
        Patients patient = Patients(
            id: p["id"],
            address: p["address"],
            email: p["email"],
            name: p["name"],
            password: p["password"]);
        patientsList.add(patient);
      }

      this.setState(() {
        _patientsList = patientsList;
      });
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
    if(_patientsList != null){
return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: <Widget>[
                  DataTable(
                    columns: [
                      DataColumn(
                        label: Text('id'),
                      ),
                      DataColumn(
                        label: Text('Email'),
                      ),
                      DataColumn(
                        label: Text('Address'),
                      ),
                      DataColumn(
                        label: Text('Password'),
                      ),
                      // Lets add one more column to show a delete button
                      DataColumn(
                        label: Text('Actions'),
                      )
                    ],
                    rows: _patientsList
                        .map(((e) => DataRow(cells: <DataCell>[
                              DataCell(Text(e.id.toString())),
                              DataCell(Text(e.email.toString())),
                              DataCell(Text(e.address.toString())),
                              DataCell(Text(e.password.toString())),
                              DataCell(IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => null,
                              )),
                            ])))
                        .toList(),
                    sortAscending: true,
                  )
                ],
              ),
            )));
    }else{
      return Scaffold(body: CircularProgressIndicator());
    }
    
  }
}
