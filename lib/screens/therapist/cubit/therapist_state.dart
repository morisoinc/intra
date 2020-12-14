part of 'therapist_cubit.dart';

@immutable
abstract class TherapistState {
  const TherapistState();
}

class TherapistInitial extends TherapistState {
  const TherapistInitial();
}

class TherapistLoading extends TherapistState {
  final Therapist therapist;

  const TherapistLoading(this.therapist);
}

class TherapistLoaded extends TherapistState {
  final Therapist therapist;

  const TherapistLoaded(this.therapist);
}

class TherapistError extends TherapistState {
  const TherapistError();
}

class Therapist {
  String id;
  String bio;
  String fullName;
  Image image;
  String specialties;
  String universityInitials;
  int yearsOfExperience;

  Therapist(Image image, DocumentSnapshot element) {
    this.image = image;
    Therapist.fromJson(element);
  }

  Therapist.fromJson(DocumentSnapshot element) {
    this.id = element.id ?? null;

    element.data().forEach((key, value) {
      switch (key) {
        case 'bio':
          bio = value ?? null;
        break;
        case 'fullName':
          fullName = value ?? null;
        break;
        case 'specialty':
          specialties = value ?? null;
        break;
        case 'universityInitials':
          universityInitials = value ?? null;
        break;
        case 'yearsOfExperience':
          yearsOfExperience = value ?? 0;
        break;
      }
    });
  }
}