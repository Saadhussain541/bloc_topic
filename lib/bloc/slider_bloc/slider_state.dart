import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

class SliderState extends Equatable
{
  final bool isSwitch;
  final double val;
  const SliderState({this.isSwitch=false,this.val=0.2});

  SliderState copyWith({bool? isSwitch, double? val})
  {
    return SliderState(isSwitch: isSwitch??this.isSwitch,val: val??this.val);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isSwitch,val];


}
