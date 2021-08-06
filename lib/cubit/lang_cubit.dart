import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_app/cubit/lang_states.dart';
import 'package:localization_app/l10n/l10n.dart';

class LangCubit extends Cubit<LangStates>{
  LangCubit() : super(LangInitialState());

  static LangCubit get(context) => BlocProvider.of(context);

  Locale mainLocale = L10n.all[0];

  void changeLang(Locale locale){
    mainLocale = locale;
    emit(LangChangeState());
  }


}