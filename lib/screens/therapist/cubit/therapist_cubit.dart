import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'therapist_state.dart';

class TherapistCubit extends Cubit<TherapistState> {

  final id;
  Therapist therapist;
  Image image;

  TherapistCubit(this.id) : super(TherapistInitial()) {
    getTherapist();
  }

  Future<void> getTherapist() async {
    try {
      print("WASSUP " + id);
      final therapistRaw = await FirebaseFirestore.instance.collection("therapist").doc(id).get();

      therapist = Therapist.fromJson(therapistRaw);

      emit(TherapistLoaded(therapist));

    } on Exception {
      emit(TherapistError());
    }
  }
}
