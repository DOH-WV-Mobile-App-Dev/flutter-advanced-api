import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: DataTable(
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
             DataRow(
            cells: [
              DataCell(Text('id')),
              DataCell(Text('name')),
              DataCell(Text('address')),
              DataCell(IconButton(icon: Icon(Icons.delete), onPressed: ()=>null,)),
            ])
          ],
        ));
  }
}
