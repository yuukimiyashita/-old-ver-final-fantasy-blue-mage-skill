import 'package:apifinalfantasy/models/final_api.dart';
import 'package:apifinalfantasy/services/remote_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FinalApi>? finalApi;
  int x = 1;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    finalApi = await RemoteService().getPosts();
    if (finalApi != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView.builder(
        itemCount: finalApi!.length,
        itemBuilder: (context, index) {
          return MaterialButton(
            child: Text(finalApi![index].name),
            onPressed: () {
              setState(() {
                x++;
              });
            },
          );
        },
      ),
    );
  }
}
