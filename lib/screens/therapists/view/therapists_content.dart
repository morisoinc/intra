import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/screens/therapists/cubit/therapists_cubit.dart';
import 'package:intra/theme.dart';
import 'package:intra/widgets/base_screen_widget/IntraContainer.dart';
import 'package:intra/widgets/base_screen_widget/IntraHeader.dart';
import 'package:intra/widgets/button/intra_back_button.dart';
import 'package:intra/widgets/button/intra_big_main_button.dart';
import 'package:intra/widgets/text/intra_page_subtitle_text.dart';
import 'package:intra/widgets/text/intra_page_title_text.dart';

class TherapistsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntraContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocConsumer<TherapistsCubit, TherapistsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is TherapistsLoading || state is TherapistsInitial) {
                return Text('');
              } else if (state is TherapistsLoaded) {
                return ListView.builder(
                    itemCount: state.therapists.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: IntraBigMainButton(
                          state.therapists[index].fullName,
                          state.therapists[index].title,
                          null,
                        ),
                      );
                    });
              }

              return Text('');
            },
          ),
        ],
      ),
      headerContent: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IntraPageTitleText('Psicólogos', color: white1),
        SizedBox(height: 14),
        IntraPageSubtitleText(
            'Veja os profissionais disponíveis e escolha o que melhor pode te ajudar',
            color: white1),
        SizedBox(height: 24),
      ]),
      bgStyle: backgroundStyle.curved,
      onBackPressed: () => Navigator.pop(context),
      headerTitle: "Agendar Consulta",
    );
  }
}
