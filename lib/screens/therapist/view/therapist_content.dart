import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/screens/therapist/cubit/therapist_cubit.dart';
import 'package:intra/widgets/base_screen_widget/IntraContainer.dart';
import 'package:intra/widgets/base_screen_widget/IntraHeader.dart';

class TherapistContent extends StatelessWidget {
  Therapist therapist;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TherapistCubit, TherapistState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TherapistLoading)
            therapist = state.therapist;
          if (state is TherapistLoaded)
            therapist = state.therapist;

          return IntraContainer(
            Container(
                child: state is TherapistLoaded
                    ? Text(state.therapist.id)
                    : Text('a')),
            headerBackgroundImage: therapist?.image,
            bgStyle: backgroundStyle.curved,
            onBackPressed: () => Navigator.pop(context),
            headerTitle: 'Agendar Consulta',
          );
        });
  }
}
