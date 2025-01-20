import 'package:cubit_statemanagement/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';
import 'next_page.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => CounterCubit(),
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
      body: Center(
        child: Column(
          children: [
            Center(child: Text("this many times you tab button")),

            BlocBuilder<CounterCubit,CounterState>(builder: (context,state){
              return Text("${state.count}",style: TextStyle(fontSize: 30),);

            }),

          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: (){
              BlocProvider.of<CounterCubit>(context).decrement();

            },
            child: Icon(Icons.remove),),
          FloatingActionButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage(),));
          },
            child: Icon(Icons.navigate_next),)
        ],
      ),
    ); ;
  }
}



