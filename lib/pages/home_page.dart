import 'package:flutter/material.dart';
import 'package:road_offender/services/database_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Road offenders'),
      ),
      body: SizedBox(
        child: FutureBuilder(
          future: getJsonObjects(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index].id),
                    subtitle: Text(snapshot.data[index].speed.toString()),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
