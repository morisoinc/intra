

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/screens/therapists/cubit/therapists_cubit.dart';
import 'package:intra/theme.dart';
import 'package:intra/widgets/base_screen_widget/IntraContainer.dart';
import 'package:intra/widgets/base_screen_widget/IntraHeader.dart';
import 'package:intra/widgets/button/intra_back_button.dart';
import 'package:intra/widgets/text/intra_page_subtitle_text.dart';
import 'package:intra/widgets/text/intra_page_title_text.dart';

class TherapistsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TherapistsCubit, TherapistsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return IntraContainer(
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            IntraBackButton(() {
              Navigator.pop(context);
            }),
            SizedBox(height: 24),
            IntraPageTitleText('Psicólogos', color: white1),
            SizedBox(height: 14),
            IntraPageSubtitleText(
                'Veja os profissionais disponíveis e escolha o que melhor pode te ajudar', color: white1),
            SizedBox(height: 24),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 31),
            ],
          ),
          bgStyle: backgroundStyle.curved,
        );
      },
    );
  }
}
