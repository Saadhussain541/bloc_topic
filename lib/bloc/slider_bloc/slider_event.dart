import 'package:equatable/equatable.dart';

abstract class SliderEvent extends Equatable
{
  SliderEvent();
  @override
  List<Object> get props=>[];

}

class EnableOrDisableNotification extends SliderEvent
{}
class ColorEvent extends SliderEvent
{
  double val1;
  ColorEvent({required this.val1});

  @override
  List<Object> get props=>[val1 ];
}