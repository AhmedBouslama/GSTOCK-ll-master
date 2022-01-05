import 'package:flutter/material.dart';
import 'package:gstock/BackEnd/database_creation.dart';
import 'package:gstock/BackEnd/Models/membre_model.dart';

class MembreEdit extends StatefulWidget {
  final Membre membre;
  final int id;
  const MembreEdit({Key? key, required this.membre, required this.id}) : super(key: key);

  @override
  _MembreEditState createState() => _MembreEditState();
}

class _MembreEditState extends State<MembreEdit> {

  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController tel1Controller = TextEditingController();
  TextEditingController tel2Controller = TextEditingController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData(){
    nomController.text = widget.membre.nom;
    prenomController.text = widget.membre.prenom;
    tel1Controller.text = widget.membre.tel1.toString();
    tel2Controller.text = widget.membre.tel2.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF2C2F33),
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
        title: Text('Edit Member'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          TextField(
            controller: nomController,
            style: TextStyle(color:Color(0xFFFF7643)),
          ),
          TextField(
            controller: prenomController,
            style: TextStyle(color:Color(0xFFFF7643)),
          ),
          TextField(
            controller: tel1Controller,
            style: TextStyle(color:Color(0xFFFF7643)),
          ),
          TextField(
            controller: tel2Controller,
            style: TextStyle(color:Color(0xFFFF7643)),
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
                Dbcreate().updateMem(widget.id,mem);
                Navigator.pushNamed(context, 'memberlist');
              },
              child: Text('Edit Member'))
        ]),
      ),
    );
  }
}
