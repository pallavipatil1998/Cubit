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

void updateNote(Map<String,dynamic> note ,int index){
  var listData=state.noteList;
  listData[index]=note;
  emit(ListState(noteList: listData));
}


void deleteNote(int index){
  var listData=state.noteList;
  listData.removeAt(index);
  emit(ListState(noteList:listData));
}

 
}