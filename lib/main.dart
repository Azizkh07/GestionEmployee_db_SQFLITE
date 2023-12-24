import 'package:flutter/material.dart';
import 'package:tpgestion/Gestionemployee/AddEmployee.dart';

///import 'package:tpgestion/Gestionemployee/AddEmployee.dart';
import 'package:tpgestion/Gestionemployee/ListEmployee.dart';

void main() {
  runApp(Gestionemployee());
}

class Gestionemployee extends StatelessWidget {
  const Gestionemployee({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AddEmployee());
  }
}
