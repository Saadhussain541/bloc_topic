import 'package:bloc/bloc.dart';
import 'package:bloc_prac/bloc/slider_bloc/slider_event.dart';
import 'package:bloc_prac/bloc/slider_bloc/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent,SliderState>
{
  SliderBloc():super(const SliderState())
  {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<ColorEvent>(_colorEvent);

  }

  void _enableOrDisableNotification(EnableOrDisableNotification event,Emitter<SliderState> emit)
  {
    emit(state.copyWith(isSwitch: !state.isSwitch));

  }
  void _colorEvent(ColorEvent events,Emitter<SliderState> emit){
    emit(state.copyWith(val: events.val1));

  }


}
