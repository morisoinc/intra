

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/screens/therapist/cubit/therapist_cubit.dart';
import 'package:intra/screens/therapist/view/therapist_content.dart';

class TherapistPage extends StatelessWidget {

  final id;

  TherapistPage(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TherapistCubit>(
      create: (context) => TherapistCubit(id),
      child: TherapistContent(),
    );
  }
}
