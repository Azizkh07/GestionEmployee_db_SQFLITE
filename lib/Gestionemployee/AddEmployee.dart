import 'package:flutter/material.dart';
import 'package:tpgestion/db/model/database.dart';
import 'package:tpgestion/db/model/employee.dart';
import 'package:tpgestion/widgets/CustomButton.dart';
import 'package:tpgestion/widgets/TextForm.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});
  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final formKey = GlobalKey<FormState>();
  var employee = ModelEmployee();
  var database = DataBaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajouter un  employee'), centerTitle: true),
      body: Center(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            children: [
              CustomTextForm(
                  label: "Matricule",
                  hint: "donner une matricule",
                  uneicon: Icons.accessibility_rounded,
                  valider: (String? value) {
                    if (value?.length == 0) return "donner une  matricule ";
                    if (value?.length != 6) return "matricule sup a 6 ";

                    return null;
                  },
                  inty: TextInputType.number,
                  save: (String? value) {
                    employee.setMatricule = int.parse(value!);
                    print(employee);
                  }),
              CustomTextForm(
                  label: "Nom",
                  hint: "donner un Nom",
                  uneicon: Icons.account_balance_wallet_rounded,
                  valider: (String? value) {
                    if (value?.length == 0) return "donner un nom ";
                    if (value!.length < 2) return "nom incorrect ";
                    return null;
                  },
                  inty: TextInputType.name,
                  save: (String? value) {
                    employee.setNom = value!;
                    print(employee);
                  }),
              CustomTextForm(
                  label: "Prenom",
                  hint: "donner un Prenom",
                  uneicon: Icons.add_card_sharp,
                  valider: (String? value) {
                    if (value?.length == 0) return "donner un prenom ";
                    if (value!.length < 2) return "prenom incorrect ";
                    return null;
                  },
                  inty: TextInputType.name,
                  save: (String? value) {
                    employee.setPrenom = value!;
                    print(employee);
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    TitreButoon: "Valider",
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        print("form valide");
                        formKey.currentState!.save();
                        print(employee);
                        database.add(employee);
                      } else {
                        print("Form invalide");
                      }
                    },
                    couleur: Colors.greenAccent,
                  ),
                  CustomButton(
                      TitreButoon: "Annuler",
                      onpressed: () {},
                      couleur: Colors.red),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
