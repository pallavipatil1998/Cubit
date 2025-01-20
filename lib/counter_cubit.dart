import 'package:cubit_statemanagement/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{

  //initial state
  CounterCubit():super(CounterState(count: 0));

  //increment fun
 void increment(){
   emit(CounterState(count: state.count+1));
 }

 //decrement fun
void decrement(){
   emit(CounterState(count: state.count-1));
}
}