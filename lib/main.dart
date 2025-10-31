import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_app/core/configs/theme/app_theme.dart';
import 'package:spotify_app/presentation/choose_mode/screens/choose_mode.dart';
//import 'package:spotify_app/presentation/intro/screens/get_started.dart';
//import 'package:spotify_app/presentation/splash/screens/splash.dart';

Future<void> main() async {
  //هذا السطر يربط Flutter بالنظام الأساسي (platform) قبل تشغيل التطبيق.
  WidgetsFlutterBinding.ensureInitialized();
  //تحدد مكان حفظ البيانات.
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb//يتحقق هل التطبيق يعمل على الويب أو الموبايل/ديسكتوب.
        ? HydratedStorageDirectory.web//يعني احفظ الحالة داخل localStorage الخاص بالمتصفح.
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),//يعني احفظ الحالة في مجلد مؤقت على الجهاز.
  );
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: ChooseModeScreen(),
    );
  }
}
