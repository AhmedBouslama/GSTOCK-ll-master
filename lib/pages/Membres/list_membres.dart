import 'package:flutter/material.dart';
import 'package:gstock/BackEnd/Models/membre_model.dart';
import 'package:gstock/BackEnd/database_creation.dart';
import 'package:gstock/pages/Membres/edit_membres.dart';

class MemberList extends StatefulWidget {
  const MemberList({Key? key}) : super(key: key);

  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  List<Map> memlist = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var list = await Dbcreate().fetchMem();
    for (var element in list) {
      memlist.add({
        'id': element.id,
        'nom': element.nom,
        'prenom': element.prenom,
        'tel1': element.tel1,
        'tel2': element.tel2
      });
    }
    setState(() {});
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
        title: const Text('Members'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: DataTable(
        columnSpacing: 1.0,
        columns: [
          DataColumn(label: Container(
            width: 80,
            child: Text('First name',style: TextStyle(fontSize: 12,color: Color(0xFFFF7643)),),
          ),),
          DataColumn(label: Container(
            width: 80,
            child: Text('Last name',style: TextStyle(fontSize: 12,color: Color(0xFFFF7643)),),
          ),),
          DataColumn(label: Container(
            width: 80,
            child: Text('Telephone',style: TextStyle(fontSize: 12,color: Color(0xFFFF7643)),),
          ),),
          DataColumn(label: Container(
            width: 100,
            child: Text('Action',style: TextStyle(fontSize: 12,color: Color(0xFFFF7643)),),
          ),),
        ],
        rows: List.generate(memlist.length, (index) {
          return DataRow(cells: <DataCell>[
            DataCell(Text(memlist.elementAt(index)['nom'],style: TextStyle(fontSize: 12,color: Color(0xFFFF7643)),)),
            DataCell(Text(memlist.elementAt(index)['prenom'],style: TextStyle(fontSize: 12,color: Color(0xFFFF7643)),)),
            DataCell(Text(memlist.elementAt(index)['tel1'].toString() +
                '/' +
                memlist.elementAt(index)['tel2'].toString(),style: TextStyle(fontSize: 12,color: Color(0xFFFF7643)),)),
            DataCell(Wrap(direction: Axis.horizontal,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MembreEdit(
                                  membre: Membre(
                                      nom: memlist.elementAt(index)['nom'],
                                      prenom:
                                          memlist.elementAt(index)['prenom'],
                                      tel1: memlist.elementAt(index)['tel1'],
                                      tel2:
                                          memlist.elementAt(index)['tel2']),
                                  id: memlist.elementAt(index)['id'],
                              )));
                    },
                    icon: Icon(Icons.edit,color: Color(0xFFFF7643))),
                IconButton(
                    onPressed: () {
                      Dbcreate().deleteMem(memlist.elementAt(index)['id']);
                      Navigator.pushNamed(context, 'memberlist');
                    },
                    icon: Icon(
                      Icons.delete,
                      color : Color(0xFFFF7643),
                    )),
              ],
            ))
          ]);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Color(0xFFFF7643),
        onPressed: () {
          Navigator.pushNamed(context, 'addmem');
        },
      ),
    );
  }
}
