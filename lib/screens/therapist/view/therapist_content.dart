import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/meta/intraSpacing/margin.dart';
import 'package:intra/screens/therapist/cubit/therapist_cubit.dart';
import 'package:intra/widgets/base_screen_widget/IntraContainer.dart';
import 'package:intra/widgets/base_screen_widget/IntraHeader.dart';
import 'package:intra/widgets/tags/intra_square_tag.dart';
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
        SizedBox(height: IntraMargin.verticalBetweenMargin,),
        Row(
          children: [
            IntraSquareTag(
              "Especialista em depressão",// + therapist.specialty,
              "",
              'assets/icon_therapist_specialty.svg',
            ),
            SizedBox(width: 5,),
            IntraSquareTag(
              "+35 anos de experiência",
              //"+" + therapist.yearsOfExperience.toString() + " anos de experiência",
              "",
              'assets/icon_therapist_experience.svg',
            ),
            SizedBox(width: 5,),
            IntraSquareTag(
              "Formado na UFSC", // + therapist.universityInitials,
              "",
              'assets/icon_therapist_university.svg',
            ),
          ],
        ),
      ],
    );
  }
}
