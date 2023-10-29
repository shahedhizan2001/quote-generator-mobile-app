import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'commen/helper/dependencie_injection.dart';
import 'commen/service/storage_sevice.dart';
import 'feature/quote/presentation/state/quote_bloc.dart';
import 'feature/quote/presentation/ui/screens/favorite.dart';
import 'feature/quote/presentation/ui/screens/home_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt.allReady();
  await StorageService.init();
  runApp(BlocProvider(create: (context) => GetIt.I<QuoteBloc>(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            routes: {
              'Home':(context) => HomeSecreen(),
              'Favorite':(context) => FavoriteSecreen(),
            },
            debugShowCheckedModeBanner: false,
            home: HomeSecreen(),
          );
        });
  }
}
