import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'therapist_state.dart';

class TherapistCubit extends Cubit<TherapistState> {
  final id;
  Therapist therapist;
  Image image;

  TherapistCubit(this.id) : super(TherapistInitial()) {
    getTherapist();
    getTherapistImage();
  }

  Future<void> getTherapist() async {
    try {
      final therapistRaw = await FirebaseFirestore.instance
          .collection("therapist")
          .doc(id)
          .get();

      therapist = Therapist.fromJson(therapistRaw);

      if (therapist.image == null)
        therapist.image = image;

      emit(therapist.image == null ? TherapistLoading(therapist) : TherapistLoaded(therapist));
    } on Exception {
      emit(TherapistError());
    }
  }

  Future<void> getTherapistImage() async {
    Image image;
    try {
      Future imageLoaded = FirebaseStorage.instance
          .ref()
          .child(id + '.png')
          .getDownloadURL();

      imageLoaded.then((downloadURL) {
        image = Image.network(downloadURL.toString(), fit: BoxFit.contain);
        this.image = image;

        if (therapist != null) {
          therapist.image = image;
          emit(TherapistLoaded(therapist));
        }
      });

    } on Exception {
      emit(TherapistError());
    }
  }
}
