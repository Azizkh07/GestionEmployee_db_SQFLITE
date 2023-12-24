import 'package:flutter/material.dart';
import 'package:tpgestion/db/model/database.dart';
import 'package:tpgestion/db/model/employee.dart';

class ListEmployee extends StatefulWidget {
  const ListEmployee({super.key});

  @override
  State<ListEmployee> createState() => _ListEmployeeState();
}

class _ListEmployeeState extends State<ListEmployee> {
  var employee = ModelEmployee();
  var database = DataBaseHelper();
  List allemp = [];
  Future readData() async {
    List response = await database.getEmployee(employee);
    setState(() {
      allemp.addAll(response);
    });
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Employee'),
        centerTitle: true,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: allemp.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(allemp[index]['nom']),
            subtitle: Text(allemp[index]['prenom']),
          ));
        },
      ),
    );
  }
}
