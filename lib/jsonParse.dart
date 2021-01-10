import 'package:billionaire_list/jsonData.dart';
import 'package:billionaire_list/services.dart';
import 'package:flutter/material.dart';

class JsonParseData extends StatefulWidget {
  @override
  _JsonParseDataState createState() => _JsonParseDataState();
}

class _JsonParseDataState extends State<JsonParseData> {
  // list for billionaire
  List<Billionaire> _finalList;
  bool _loading;

  @override
  void initState() {
    super.initState();
    // when the app loades then it will set the loading to be true
    _loading = true;

    // making the request when the app is started
    ServiceJson.getBillionaire().then((finalList) {
      _finalList = finalList;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: Text(
          _loading ? "Loading.." : "Billionaire List",
        ),
      ),
      body: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: null == _finalList ? 0 : _finalList.length,
            itemBuilder: (context, index) {
              Billionaire parser = _finalList[index];
              return ListTile(
                leading: CircleAvatar(
                  // taking the first text from name
                  child: Text(parser.personName[0]),
                ),
                title: Text(parser.personName),
                subtitle: Text(parser.source),
                trailing: Text("Rank #" + parser.rank.toString()),
              );
            },
          )),
    );
  }
}
