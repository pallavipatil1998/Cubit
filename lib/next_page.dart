import 'package:cubit_statemanagement/counter_cubit.dart';
import 'package:cubit_statemanagement/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Next Page"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(child: Text("this many times you tab button")),
           BlocBuilder<CounterCubit,CounterState>(builder: (ctx,state){
             return Text("${state.count}",style: TextStyle(fontSize: 30),);

           })

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            BlocProvider.of<CounterCubit>(context).increment();
          },
        child: Icon(Icons.add),
      ),
    );
  }
}
