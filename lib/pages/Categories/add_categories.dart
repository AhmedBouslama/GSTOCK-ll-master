import 'package:flutter/material.dart';
import 'package:gstock/BackEnd/Models/category_model.dart';
import 'package:gstock/BackEnd/database_creation.dart';

class AddCateg extends StatefulWidget {
  const AddCateg({Key? key}) : super(key: key);

  @override
  _AddCategState createState() => _AddCategState();
}

class _AddCategState extends State<AddCateg> {
  TextEditingController nameController = TextEditingController();

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
        title: Text('Add Category'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                hintText: 'Category Name',
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
                var categ = Category(name: nameController.text);
                Dbcreate().insertCateg(categ);
                Navigator.pushNamed(context, 'categorylist');
              },
              child: Text('Save Category')),

        ]),
      ),
    );
  }
}
