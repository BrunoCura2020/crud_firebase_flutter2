import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
        future: getPeople(),
        //snapshot: es el resultado de lo que me devuelve ek getPeople, es decir, una lista
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data?[index]['name']),
                  onTap: (() async {
                    await Navigator.pushNamed(context, '/edit', arguments: {
                      'name': snapshot.data?[index]['name'],
                      'uid': snapshot.data?[index]['uid'],
                    });

                    setState(() {
                      
                    });
                  }),
                );  
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}

