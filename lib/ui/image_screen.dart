
import 'dart:io';

import 'package:bloc_prac/bloc/image_bloc/image_bloc.dart';
import 'package:bloc_prac/bloc/image_bloc/image_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/image_bloc/image_state.dart';
class ImageExample extends StatefulWidget {
  const ImageExample({super.key});

  @override
  State<ImageExample> createState() => _ImageExampleState();
}

class _ImageExampleState extends State<ImageExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ImageBloc,ImageState>(
          builder: (context, state) {
            if(state.file==null)
              {
              return   GestureDetector(
                  onTap: (){
                   showModalBottomSheet(context: context, builder: (context) {
                     return Row(
                       children: [
                         Expanded(child: GestureDetector(
                           onTap: (){
                             context.read<ImageBloc>().add(CameraCapture());
                           },
                           child: Container(
                             height: 100,
                             color: Colors.deepPurple,
                             child: Center(
                               child: Text('Select From Camera',style: TextStyle(
                                   color: Colors.white
                               ),),
                             ),
                           ),
                         )),
                         Expanded(child: GestureDetector(
                           onTap: (){
                             context.read<ImageBloc>().add(GalleryImageCapture());
                           },
                           child: Container(
                             height: 100,
                             color: Colors.blue,
                             child: Center(
                               child: Text('Select From Gallery',style: TextStyle(
                                   color: Colors.white
                               ),),
                             ),
                           ),
                         )),
                       ],
                     );
                   },);

                  },
                  child: Icon(Icons.camera,color: Colors.purple,),
                );
              }
            else
              {
                return Image.file(File(state.file!.path.toString()));
              }
          },
        ),
      ),
    );
  }
}
