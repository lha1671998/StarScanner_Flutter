import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_scanner/routers/router.dart';
import 'package:star_scanner/routers/routes.dart';
import 'package:star_scanner/screen/SplashScreen.dart';

import 'bloc/documents/documents_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return MultiBlocProvider(
      providers: [
        BlocProvider<DocumentsBloc>(create: (context) => DocumentsBloc()),
        // Add DocBloc provider
        // Add other bloc providers if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Star Scanner',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[50],
        ),
        home: const SplashScreen(),
        initialRoute: RoutePaths.splashRoute,
        onGenerateRoute: RouterPage.generateRoute,
      ),
    );
  }
}
