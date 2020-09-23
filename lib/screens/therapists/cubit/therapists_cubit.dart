import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'therapists_state.dart';

class TherapistsCubit extends Cubit<TherapistsState> {
  TherapistsCubit() : super(TherapistsInitial()) {
    getTherapists();
  }

  Future<void> getTherapists() async {
    try {
      emit(TherapistsLoading());
      final therapistsRaw =
          await FirebaseFirestore.instance.collection('therapist').get();

      var therapists = List<Therapist>();
      therapistsRaw.docs.forEach((element) {
        therapists.add(Therapist.fromJson(element));
      });

      emit(TherapistsLoaded(therapists));

    } on Exception {
      emit(TherapistsError());
    }
  }
}
