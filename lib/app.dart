// lib/app.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ui_components/data/repositories/home_repository.dart';
import 'package:ui_components/data/repositories/details_repository.dart';
import 'package:ui_components/features/home/bloc/home_bloc.dart';
import 'package:ui_components/features/home/bloc/home_event.dart';
import 'package:ui_components/features/details/bloc/details_bloc.dart';
import 'package:ui_components/screens/home_screen.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.interTextTheme(),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2DA67A),
        surface: Colors.white,
        outline: const Color(0xFFE9EDF0),
      ),
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeRepository>(create: (_) => HomeRepository()),
        RepositoryProvider<DetailsRepository>(
            create: (_) => DetailsRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (ctx) =>
                HomeBloc(ctx.read<HomeRepository>())..add(const HomeStarted()),
          ),
          BlocProvider<DetailsBloc>(
            create: (ctx) => DetailsBloc(ctx.read<DetailsRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Food App',
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
