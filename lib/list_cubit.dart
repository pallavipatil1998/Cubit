import 'package:cubit_statemanagement/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<ListState>{

  //initial state
ListCubit():super(ListState(noteList: []));


void addNote(Map<String,dynamic> note){
  var listData=state.noteList;
  listData.add(note);
  emit(ListState(noteList: listData));
  
}


void deleteNote(int index){
  var listData=state.noteList;
  listData.removeAt(index);
  emit(ListState(noteList:listData));
}
 
}