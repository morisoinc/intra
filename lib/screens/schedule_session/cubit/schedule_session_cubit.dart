import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'schedule_session_state.dart';

class ScheduleSessionCubit extends Cubit<ScheduleSessionState> {
  ScheduleSessionCubit() : super(ScheduleSessionInitial());
}
