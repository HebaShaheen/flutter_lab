// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../Helpers/colors.dart';
import '../../Services/Dbhelper.dart';
import '../../Widgets/CustomText.dart';
import '../../Widgets/CustomTextField.dart';
import '../Home/Home.dart';
import '../../Helpers/data.dart';

class NotesForm extends StatefulWidget {
  late Map<String, dynamic>? data;
  NotesForm({this.data});
  @override
  State<NotesForm> createState() => _NotesFormState();
}

class _NotesFormState extends State<NotesForm> {
  int currentcolor = 0xFF1321E0;
  TextEditingController addres = TextEditingController();
  TextEditingController content = TextEditingController();

  Future<void> _addItem() async {
    Map<String, dynamic> data = {
      'addres': addres.text,
      'content': content.text,
      'color': currentcolor,
      'createdAt': DateTime.now().toString()
    };
    await Dbhelper.create('notes', data);
    addres.text = data['addres'];
    content.text = data['content'];
    await saveState();
  }

  Future<void> Update() async {
    Map<String, dynamic> data = {
      'id': widget.data!['id'],
      'addres': addres.text,
      'content': content.text,
      'color': currentcolor,
    };
    await Dbhelper.update('notes', data);
    addres.text = data['addres']; //
    content.text = data['content']; //
    await saveState();
  }

  Future<void> delete() async {
    await Dbhelper.delete('notes', widget.data!['id']);
    await saveState();
  }

  Future<void> saveState() async {
    Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Home()),
        (Route<dynamic> route) => true).then((value) => setState(() {}));
  }

  @override
  void initState() {
    if (widget.data != null) {
      addres.text = widget.data!['addres'];
      content.text = widget.data!['content'];
      currentcolor = widget.data!['color'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(currentcolor),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios)),
                SizedBox(
                  width: 10,
                ),
                CustomText(
                  title: widget.data != null ? "Edit Note" : "Add Note",
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Color(currentcolor),
                          context: context,
                          builder: (context) {
                            return Wrap(
                              children: [
                                ListTile(
                                  //////////////////////////////
                                  leading: Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    Share.share(
                                      widget.data!['addres'] +
                                          "\n" +
                                          widget.data!['content'],
                                    );
                                  },
                                  title: Text('Share with your Friends'),
                                ),
                                ListTile(
                                    leading: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                    title: Text('Delete'),
                                    onTap: () {
                                      delete();
                                    }),
                                ListTile(
                                  leading: Icon(
                                    Icons.copy,
                                    color: Colors.white,
                                  ),
                                  title: Text('Deplicate'),
                                  onTap: () {
                                    if (widget.data != null) {
                                      _addItem();
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: colors.Colorlist.map((e) =>
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              currentcolor = e;
                                              colors.primarycolor = Color(e);
                                            });
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            margin: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade400),
                                                color: Color(e),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: currentcolor == e
                                                ? Center(
                                                    child: Icon(
                                                    Icons.check,
                                                    size: 25,
                                                  ))
                                                : Container(),
                                          ),
                                        )).toList(),
                                  ),
                                ))
                              ],
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.more_vert,
                        size: 25,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (widget.data != null) {
                        Update();
                      } else if (addres != null) {
                        _addItem();
                      }
                    },
                    child: // IconButton(
                        //   icon: new Icon(Icons.check),
                        //   highlightColor: Colors.pink,
                        //   // onPressed: () {
                        //   //   Navigator.push(
                        //   //     context,
                        //   //     MaterialPageRoute(builder: (context) => Home()),
                        //   //   );
                        //   // },
                        // )),

                        Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 25,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                // text: "  Type something....",
                // controller: addres,
                // color: Color(currentcolor),
                // inputcolor: Color(currentcolor),
                decoration: const InputDecoration(
                  labelText: 'Type something....',
                  hintText: 'Type something....',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: size.height * 0.30,
                child: CustomTextField(
                  text: "  Type something....",
                  controller: content,
                  color: Color(currentcolor),
                ),
              ),
            ],
          ),
        ));
  }
}
