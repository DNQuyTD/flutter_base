import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/routes/route.dart';
import 'package:time_tracker/ui/screens/login/login_cubit.dart';
import 'configs/theme_manager.dart';
import 'core/services/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit> (create: (context) => di.sl<LoginCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        routerConfig: AppRouter().router,
      ),
    );
  }
}
