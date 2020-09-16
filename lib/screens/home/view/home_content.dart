

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intra/screens/home/cubit/home_cubit.dart';
import 'package:intra/widgets/IntraContainer.dart';
import 'package:intra/widgets/button/intra_big_main_button.dart';
import 'package:intra/widgets/button/intra_split_pill_button.dart';
import 'package:intra/widgets/text/intra_page_subtitle_text.dart';
import 'package:intra/widgets/text/intra_subpage_title_text.dart';
import 'package:intra/widgets/text/intra_page_title_text.dart';

class HomeContent extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return IntraContainer(
          Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntraSubpageTitleText('Olá, ' + state.userName + '!'),
                    SizedBox(height: 8),
                    IntraPageSubtitleText('Como está se sentindo hoje?'),
                    SizedBox(height: 16),

                    IntraSplitPillButton('Consultas', '2 agendadas', 'Tarefas', '5 anotadas'),
                    SizedBox(height: 32),

                    IntraBigMainButton('Agendar Consulta', 'Veja o perfil dos psicólogos e escolha seu horário'),

                  ],
                ),
              )
            ],
          )
        );
      }
    );
  }
}