import 'package:flutter/material.dart';
import 'package:gstock/BackEnd/Models/membre_model.dart';
import 'package:gstock/BackEnd/database_creation.dart';

class AddMembre extends StatefulWidget {
  const AddMembre({Key? key}) : super(key: key);

  @override
  _AddMembreState createState() => _AddMembreState();
}

class _AddMembreState extends State<AddMembre> {

  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController tel1Controller = TextEditingController();
  TextEditingController tel2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF2C2F33),
      resizeToAvoidBottomInset: false,
      drawer : Drawer (
        child : Container(color: Color(0xFF2C2F33),
            child : ListView(
              padding : EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration : BoxDecoration(
                    gradient : LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Color(0xFFFFA53E), Color(0xFFFF7643)],
                    ),
                  ),
                  child : Text ("Menu"),
                ),

                ListTile(
                  title : const Text (
                    'Members',
                    style: TextStyle(color: Color(0xFFFF7643)),),
                  onTap:(){
                    Navigator.pushNamed(context, 'memberlist');
                  },
                ),
                ListTile(
                  title : const Text (
                    'Categories',
                    style: TextStyle(color: Color(0xFFFF7643)),),
                  onTap:(){
                    Navigator.pushNamed(context, 'categorylist');
                  },
                ),
              ],
            )
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF7643),
        title: Text('Add Membre'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          TextField(
            controller: nomController,
            decoration: InputDecoration(
                hintText: 'First Name',
                hintStyle: TextStyle(color: Color(0xFFFF7643)),),
          ),
          TextField(
            controller: prenomController,
            decoration: InputDecoration(
                hintText: 'Last Name',
              hintStyle: TextStyle(color: Color(0xFFFF7643)),),
          ),
          TextField(
            controller: tel1Controller,
            decoration: InputDecoration(
                hintText: 'Telephone 1',
              hintStyle: TextStyle(color: Color(0xFFFF7643)),),
          ),
          TextField(
            controller: tel2Controller,
            decoration: InputDecoration(
                hintText: 'Telephone 2',
              hintStyle: TextStyle(color: Color(0xFFFF7643)),),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(300),
                textStyle: const TextStyle(fontSize: 20),
                padding: const EdgeInsets.all(16),
                primary: Color(0xFFFF7643),
              ),
              onPressed: () {
                var mem = Membre(
                    nom: nomController.text,
                    prenom: prenomController.text,
                    tel1: int.parse(tel1Controller.text),
                    tel2: int.parse(tel1Controller.text));
                Dbcreate().insertMem(mem);
                Navigator.pushNamed(context, 'memberlist');
              },
              child: Text('Save Membre'))
        ]),
      ),
    );
  }
}
