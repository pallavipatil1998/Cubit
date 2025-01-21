import 'package:cubit_statemanagement/list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'list_state.dart';
import 'next_page.dart';

void main() {
  runApp(BlocProvider(
      create: (context) =>ListCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),

    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: BlocBuilder<ListCubit,ListState>(
          builder: (context,state){
            return ListView.builder(
              itemCount: state.noteList.length,
                itemBuilder: (ctx,index){
                  return ListTile(
                    leading: Text("$index+1"),
                    title: Text("${state.noteList[index]["title"]}"),
                    subtitle:Text("${state.noteList[index]["desc"]}"),
                    trailing: InkWell(
                      onTap: (){
                        BlocProvider.of<ListCubit>(context).deleteNote(index);
                        // context.read<ListCubit>().deleteNote(index);
                      },
                        child: Icon(Icons.delete)),
                  );
                }
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage(),));
        },
        child: Icon(Icons.navigate_next),
      ),


    );
  }
}



