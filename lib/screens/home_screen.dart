import 'package:flutter/material.dart';
import 'package:maps/data/locations.dart';

// import 'package:provider/provider.dart';

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Color(0xff525252), Color(0xff3d72b4)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          title: const Center(
            child: Text(
              'Todos',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          elevation: 0,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/map", arguments: {
                  "index": index,
                });
              },
              child: ListTile(
                title: Text(worldWondersList[index].name),
                subtitle: Text(worldWondersList[index].description),
                trailing: CircleAvatar(
                  child: Text(
                    index.toString(),
                  ),
                ),
              ),
            );
          },
          itemCount: worldWondersList.length,
        ));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
