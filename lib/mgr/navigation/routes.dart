import 'package:pokemon_go/presentation/template/template.dart';

class AppRoutes {
  static const routeToHome = '/';
  static const routeToPokemonPage = '/pokemon_page';
  static const routeToPokemonDetailsView = '/pokemon_details_view';
  static const routeToMapPage = '/map_page';

  static Map<String, WidgetBuilder> getRoutes() {
    Map<String, WidgetBuilder> base = {
      AppRoutes.routeToHome: (BuildContext _) => const Home(),
      AppRoutes.routeToPokemonPage: (BuildContext _) => const PokemonPage(),
      AppRoutes.routeToPokemonDetailsView: (BuildContext _) =>
          const PokemonDetailsView(),
      AppRoutes.routeToMapPage: (BuildContext _) => const MapPage(),
    };

    return base;
  }
}
