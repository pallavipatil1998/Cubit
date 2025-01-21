import 'dart:async';
import 'dart:math';

import 'package:cubit_statemanagement/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<ListState>{

  //initial state
ListCubit():super(ListState(noteList: []));


void addNote(Map<String,dynamic> note){
  emit(ListState(noteList: state.noteList,
    isLoading: true
  ));
  Timer(
      Duration(seconds: Random().nextInt(5)),
          (){
        if(Random().nextInt(1000)%5==0){
          emit(ListState(
            noteList:state.noteList,
            isEroor: true,
            errorMsg: "Error Occured",

          ));
        }else{
          var listData=state.noteList;
          listData.add(note);
          emit(ListState(noteList: listData,));
        }
        }
  );

  
}

void update(Map<String,dynamic> notes,int index){
  var noteData=state.noteList;
  noteData.where((element) => element[index]==index,);
  noteData[index]=notes;
  emit(ListState(noteList: noteData));

}


void deleteNote(int index){
  var listData=state.noteList;
  listData.removeAt(index);
  emit(ListState(noteList:listData));
}

 
}