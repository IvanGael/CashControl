import 'package:cash_control/constants/attributes.dart';
import 'package:cash_control/constants/colors.dart';
import 'package:cash_control/providers/theme_provider.dart';
import 'package:cash_control/providers/user_first_time_provider.dart';
import 'package:cash_control/screens/auth/login/login_screen.dart';
import 'package:cash_control/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';


// flutter pub run flutter_launcher_icons:main
// flutter pub run flutter_native_splash:create --path=native_splash.yaml

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserFirstTimeProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late UserFirstTimeProvider userFirstTimeProvider;

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }


  @override
  void initState() {
    // initialization();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    userFirstTimeProvider = Provider.of<UserFirstTimeProvider>(context);
    
    // Changer la couleur de la barre d'état
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.color4, // Couleur de la barre d'état
        statusBarIconBrightness: Brightness.light, // Couleur des icônes (blanc ou noir)
      )
    );
    
    return MaterialApp(
      title: AppAttributes.appName,
      theme: Provider.of<ThemeProvider>(context).getThemeData(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/login": (context) => const LoginScreen(),
        "/onboarding": (context) => const OnboardingScreen()
      },
      home: userFirstTimeProvider.isUserFirstTime == true
      ? const OnboardingScreen() : const LoginScreen(),
    );
  }
}

