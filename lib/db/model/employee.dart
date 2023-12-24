// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelEmployee {
  int matricule;
  String nom;
  String prenom;
  ModelEmployee({
    this.matricule = 0,
    this.nom = "",
    this.prenom = "",
  });

  int get getMatricule => this.matricule;

  set setMatricule(int matricule) => this.matricule = matricule;

  get getNom => this.nom;

  set setNom(nom) => this.nom = nom;

  get getPrenom => this.prenom;

  set setPrenom(prenom) => this.prenom = prenom;
  @override
  String toString() =>
      'ModelEmployee(matricule: $matricule, nom: $nom, prenom: $prenom)';

  ModelEmployee copyWith({
    int? matricule,
    String? nom,
    String? prenom,
  }) {
    return ModelEmployee(
      matricule: matricule ?? this.matricule,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'matricule': matricule,
      'nom': nom,
      'prenom': prenom,
    };
  }

  factory ModelEmployee.fromMap(Map<String, dynamic> map) {
    return ModelEmployee(
      matricule: map['matricule'] as int,
      nom: map['nom'] as String,
      prenom: map['prenom'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelEmployee.fromJson(String source) =>
      ModelEmployee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant ModelEmployee other) {
    if (identical(this, other)) return true;

    return other.matricule == matricule &&
        other.nom == nom &&
        other.prenom == prenom;
  }

  @override
  int get hashCode => matricule.hashCode ^ nom.hashCode ^ prenom.hashCode;
}
