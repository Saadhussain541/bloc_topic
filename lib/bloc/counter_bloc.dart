import 'package:bloc/bloc.dart';
import 'package:bloc_prac/bloc/counter_event.dart';
import 'package:bloc_prac/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>
{

  CounterBloc():super(const CounterState())
  {
    on<IncreamentCounter>(_increament);
    on<DecreamentCounter>(_decreament);
  }

  void _increament(CounterEvent event,Emitter<CounterState> emit)
  {
    emit(state.copyWith(counter: state.counter+1));
  }

  void _decreament(CounterEvent event, Emitter<CounterState> emit)
  {
    if(state.counter>0)
      {
        emit(state.copyWith(counter: state.counter-1));
      }

  }




}
