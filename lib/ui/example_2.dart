import 'package:bloc_prac/bloc/slider_bloc/slider_bloc.dart';
import 'package:bloc_prac/bloc/slider_bloc/slider_event.dart';
import 'package:bloc_prac/bloc/slider_bloc/slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notification',style: TextStyle(
                    color: Colors.purple,
                    fontSize: 18
                  ),),
                  BlocBuilder<SliderBloc,SliderState>(
                    buildWhen: (previous, current) => previous.isSwitch!=current.isSwitch,
                    builder: (context, state) {
                    return Switch(value: state.isSwitch, onChanged: (value){
                      context.read<SliderBloc>().add(EnableOrDisableNotification());
                    });
                  },),

                ],
              ),
              SizedBox(height: 20,),
             BlocBuilder<SliderBloc,SliderState>(builder: (context, state) {
               return  Container(
                 width: double.infinity,
                 height: 180,
                 decoration: BoxDecoration(
                     color: Colors.red.withOpacity(state.val)
                 ),
               );
             },),
              SizedBox(height: 20,),
              BlocBuilder<SliderBloc,SliderState>(
                buildWhen: (previous, current) => previous.val!=current.val,
                builder: (context, state) {
                return Slider(value: state.val, onChanged: (value){
                  context.read<SliderBloc>().add(ColorEvent(val1: value));
                });
              },)


            ],
          ),
        ),
      ),
    );
  }
}
