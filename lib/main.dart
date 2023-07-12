import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_app/RegistredBloc/registered_bloc.dart';
import 'package:help_app/bloc/get_org_bloc.dart';
import 'package:help_app/bloc/get_user_bloc.dart';
import 'package:help_app/bloc/org_bloc.dart';
import 'package:help_app/firebase_option.dart';
import 'package:help_app/screens/navigation/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisteredBloc(),
        ),
        BlocProvider(
          create: (context) => GetUserBloc(),
        ),
        BlocProvider(
          create: (context) => OrgBloc(),
        ),
        BlocProvider(
          create: (context) => GetOrgBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: Navigation(),
      ),
    );
  }
}
