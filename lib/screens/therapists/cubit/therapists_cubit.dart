import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'therapists_state.dart';

class TherapistsCubit extends Cubit<TherapistsState> {
  TherapistsCubit() : super(TherapistsInitial());
}
