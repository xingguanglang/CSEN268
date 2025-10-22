// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/book_cubit.dart';
import 'pages/home_page.dart';
import 'theme/design_system.dart';
// 在某个 Widget 的 initState 或 main() 调用
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


Future<void> printAssetManifest() async {
  final manifest = await rootBundle.loadString('AssetManifest.json');
  final Map<String, dynamic> map = json.decode(manifest);
  // 列出所有 assets（或只看某个路径）
  print('Has assets/images? ${map.keys.any((k) => k.startsWith('assets/images/'))}');
  print('Contains dont_look_back.svg? ${map.containsKey("assets/images/dont_look_back.svg")}');
}

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book Club',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: AppText.appBarTitle,
            iconTheme: const IconThemeData(color: AppColors.textPrimary),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
