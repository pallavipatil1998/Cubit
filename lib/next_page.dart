import 'package:cubit_statemanagement/list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextPage extends StatelessWidget {
  var titleController=TextEditingController();
  var descController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Next Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Add Note"),
          TextField(controller: titleController,),
          TextField(controller: descController,),
          ElevatedButton(
              onPressed: (){
                var mTitle=titleController.text.toString();
                var mDesc=descController.text.toString();
               if(mTitle!="" && mDesc!=""){
                 context.read<ListCubit>().addNote(
                     {
                       "title":mTitle,
                       "desc": mDesc
                     }
                 );
               }
              },
              child:Text("ADD")
          )
        ],
      )

    );
  }
}