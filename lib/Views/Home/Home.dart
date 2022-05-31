import 'package:flutter/material.dart';
import '../../Services/Dbhelper.dart';
import '../../Views/Notes/NotesForm.dart';
import '../../Helpers/colors.dart';
import '../../Widgets/CustomText.dart';
import '../../Widgets/EmptyNotes.dart';
import '../../Widgets/NoteWidgets.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> data = [];
  bool isloading = false;
  void getData() async {
    isloading = true;
    final items = await Dbhelper.getall('notes');
    setState(() {
      data = items;
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colors.primarycolor,
        title: CustomText(
          title: "My Notes",
          size: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      body: data.length != 0
          ? isloading
              ? CircularProgressIndicator(
                  color: colors.primarycolor,
                )
              : RefreshIndicator(
                  onRefresh: () async => getData(),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: ListView.separated(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NotesForm(
                                    data: data[index],
                                  )));
                        },
                        child: NoteWidgets(
                          data: data[index],
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 15,
                      ),
                    ),
                  ),
                )
          : EmptyNotes(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                  colors: [colors.primarycolor, Colors.purple],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.5, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Center(
                child: Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ))),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NotesForm(
                    data: null,
                  )));
        },
      ),
    );
  }
}
