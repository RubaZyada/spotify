import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_app/core/configs/theme/app_theme.dart';
import 'package:spotify_app/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify_app/presentation/splash/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async {
  //تهيئة الفلاتر قبل تشغيل التطبيق.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  //تحدد مكان حفظ البيانات.
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb //يتحقق هل التطبيق يعمل على الويب أو الموبايل/ديسكتوب.
        ? HydratedStorageDirectory
              .web //يعني احفظ الحالة داخل localStorage الخاص بالمتصفح.
        : HydratedStorageDirectory(
            (await getTemporaryDirectory()).path,
          ), //يعني احفظ الحالة في مجلد مؤقت على الجهاز.
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) =>
          MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
            home: SplashScreen(),
          )
        ,
      ),
    );
  }
}
