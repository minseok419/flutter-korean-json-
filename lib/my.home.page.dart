import 'package:flutter/material.dart';
import 'package:flutter_application_1/user.api.dart';
import 'package:flutter_application_1/user.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  
  late Future<List<User>> users;

  @override
  void initState(){
    super.initState();
    users = getUsers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("유저 목록"),
      ),
        body: FutureBuilder(
         future: users,
          builder: (context, snapshot) {
           if (snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  User user = snapshot.data![index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              );
            }

          else {
            return const Center(
              child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}