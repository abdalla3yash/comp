import 'package:comp/config/navigation/navigation_services.dart';
import 'package:comp/config/navigation/route_generator.dart';
import 'package:comp/config/navigation/routes.dart';
import 'package:comp/config/theme/theme.dart';
import 'package:comp/core/services/bloc_observer.dart';
import 'package:comp/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';
import 'di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<HomeCubit>()),
      ],
      child: MaterialApp(
        title: 'Comp',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.mainScreen,
        navigatorKey: NavigationService.navigationKey,
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        builder: (context, child) {
          return child!;
        },
      ),
    );
  }
}
