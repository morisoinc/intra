import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/screens/therapist/cubit/therapist_cubit.dart';
import 'package:intra/widgets/base_screen_widget/IntraContainer.dart';
import 'package:intra/widgets/base_screen_widget/IntraHeader.dart';
import 'package:intra/widgets/text/intra_instructive_title.dart';

class TherapistContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TherapistCubit, TherapistState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TherapistLoading) {
            return IntraContainer(
              TherapistBody(state.therapist),
              headerBackgroundImage: state.therapist?.image,
              bgStyle: backgroundStyle.curved,
              onBackPressed: () => Navigator.pop(context),
              headerTitle: 'Agendar Consulta',
            );
          } else if (state is TherapistLoaded) {
            print('image is loaded mah boys');
            return IntraContainer(
              TherapistBody(state.therapist),
              headerBackgroundImage: state.therapist?.image,
              bgStyle: backgroundStyle.curved,
              onBackPressed: () => Navigator.pop(context),
              headerTitle: 'Agendar Consulta',
            );
          }
          return Container();
        });
  }
}

class TherapistBody extends StatelessWidget {

  final Therapist therapist;

  TherapistBody(this.therapist);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntraInstructiveTitle(therapist.fullName),
        ],
      );
  }
}

