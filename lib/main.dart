import 'package:pokemon_go/presentation/template/template.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PokemonGo());
}

class PokemonGo extends StatelessWidget {
  const PokemonGo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonBloc(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, widget) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PokemonGO',
          initialRoute: AppRoutes.routeToHome,
          routes: AppRoutes.getRoutes(),
        ),
      ),
    );
  }
}
