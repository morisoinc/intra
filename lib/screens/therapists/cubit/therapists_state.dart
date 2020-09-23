part of 'therapists_cubit.dart';

@immutable
abstract class TherapistsState {
  const TherapistsState();
}

class TherapistsInitial extends TherapistsState {
  const TherapistsInitial();
}

class TherapistsLoading extends TherapistsState {

}

class TherapistsLoaded extends TherapistsState {
  final List<Therapist> therapists;

  const TherapistsLoaded(this.therapists);
}

class TherapistsError extends TherapistsState {
  const TherapistsError();
}


class Therapist {
  String id;
  String bio;
  String fullName;
  String title;
  List university;

  Therapist.fromJson(QueryDocumentSnapshot element) {
    id = element.id;
    if (id == null)
      id = '';

    bio = element.get('bio');
    if (bio == null)
      bio = '';

    fullName = element.get('fullName');
    if (fullName == null)
      fullName = '';

    title = element.get('title');
    if (title == null)
      title = '';

    university = element.get('university');
    if (university == null)
      university = [];
  }
}