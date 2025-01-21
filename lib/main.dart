import 'package:cubit_statemanagement/list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'list_state.dart';

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
  var titleController=TextEditingController();
  var descController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: Center(
        child: BlocBuilder<ListCubit,ListState>(
            builder: (context,state){
             if(state.isLoading){
               return Center(child: CircularProgressIndicator());
             }else if (state.isEroor){
               return Center(child: Text("${state.errorMsg}"));
             }else{
               return state.noteList.isNotEmpty ? ListView.builder(
                   itemCount: state.noteList.length,
                   itemBuilder: (ctx,index){
                     return ListTile(
                       leading: Text("${index+1}"),
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
               ) :Text("No Data Found");
             }
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context,
              builder:(ctx){
            return  Container(
              child: Column(children: [
                Text("ADD"),
                TextField(controller: titleController,),
                TextField(controller: descController,),
                ElevatedButton(onPressed: (){
                  var mTitle=titleController.text.toString();
                  var mDesc=descController.text.toString();
                  context.read<ListCubit>().addNote({
                    "title":mTitle,
                    "desc":mDesc
                  });
                  titleController.clear();
                  descController.clear();
                  Navigator.pop(context);
                },
                    child: Text("ADD"))

              ],),
            );
              }
          );

        },
        child: Icon(Icons.add),
      ),


    );
  }
}



