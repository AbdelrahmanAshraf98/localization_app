import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_app/cubit/lang_cubit.dart';
import 'cubit/lang_states.dart';
import 'l10n/l10n.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Locale mainLocale = L10n.all[0];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LangCubit(),
      child: BlocConsumer<LangCubit,LangStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.teal.shade100,
              primaryColor: Colors.teal,
            ),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            locale: LangCubit.get(context).mainLocale,
            supportedLocales: L10n.all,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.language),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              iconEnabledColor: Colors.white,
              value:  LangCubit.get(context).mainLocale,
              items: L10n.all.map((locale) {
                final flag = L10n.getFlag(locale.languageCode);
                return DropdownMenuItem(
                  child: Center(
                    child: Text(flag,style: TextStyle(fontSize: 32),),
                  ),
                  value: locale,
                  onTap: () {
                    LangCubit.get(context).changeLang(locale);
                  },
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          flagWidget(context),
          SizedBox(
            height: 20.0,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            AppLocalizations.of(context)!.hello('Abd Elrahman'),
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

Widget flagWidget(context) {
  final locale = Localizations.localeOf(context);
  final flag = L10n.getFlag(locale.languageCode);
  return Center(
    child: CircleAvatar(
      backgroundColor: Colors.teal,
      radius: 72,
      child: Text(
        flag,
        style: TextStyle(fontSize: 80),
      ),
    ),
  );
}
