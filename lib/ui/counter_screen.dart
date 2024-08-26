import 'package:bloc_prac/bloc/counter_bloc.dart';
import 'package:bloc_prac/bloc/counter_event.dart';
import 'package:bloc_prac/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc,CounterState>(
              
              builder: (context, state) {
              return Text(state.counter.toString(),style: TextStyle(
                  color: Colors.purple,
                  fontSize: 30
              ),);
            },),


            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  context.read<CounterBloc>().add(IncreamentCounter());
                }, child: Text('Increament')),
                SizedBox(width: 20,),
                ElevatedButton(onPressed: (){
                  context.read<CounterBloc>().add(DecreamentCounter());

                }, child: Text('Decreament')),
              ],
            )

          ],
        ),
      ),
    );
  }
}
