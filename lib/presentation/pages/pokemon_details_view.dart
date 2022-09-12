import 'package:pokemon_go/presentation/template/template.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoadInProgress) {
              return const Center(child: CircularProgressIndicator());
            }
            // if (state is PokemonPageLoadSuccess) {
            //   return Center(
            //     child: SingleChildScrollView(
            //       child: Column(
            //         children: [
            //           Expanded(
            //             flex: 1,
            //             child: Card(
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                 children: [
            //                   Image.network(state.imageUrl),
            //                   Text(state.name),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: state.types
            //                         .map((type) => _pokemonTypeView(type))
            //                         .toList(),
            //                   ),
            //                   Text(
            //                       'ID: ${state.id}  -  Weight: ${state.weight}  -  Height: ${state.height}'),
            //                 ],
            //               ),
            //             ),
            //           ),
            //           Expanded(
            //             flex: 2,
            //             child: SizedBox(
            //               width: double.infinity,
            //               child: Card(
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(8),
            //                   child: Text(
            //                     state.description,
            //                     textAlign: TextAlign.center,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   );
            // }
            if (state is PokemonPageLoadFailed) {
              return Center(child: Text(state.error.toString()));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  // Widget _pokemonTypeView(String type) {
  //   Color color;

  //   switch (type) {
  //     case 'normal':
  //       color = const Color(0xFFbdbeb0);
  //       break;
  //     case 'poison':
  //       color = const Color(0xFF995E98);
  //       break;
  //     case 'psychic':
  //       color = const Color(0xFFE96EB0);
  //       break;
  //     case 'grass':
  //       color = const Color(0xFF9CD363);
  //       break;
  //     case 'ground':
  //       color = const Color(0xFFE3C969);
  //       break;
  //     case 'ice':
  //       color = const Color(0xFFAFF4FD);
  //       break;
  //     case 'fire':
  //       color = const Color(0xFFE7614D);
  //       break;
  //     case 'rock':
  //       color = const Color(0xFFCBBD7C);
  //       break;
  //     case 'dragon':
  //       color = const Color(0xFF8475F7);
  //       break;
  //     case 'water':
  //       color = const Color(0xFF6DACF8);
  //       break;
  //     case 'bug':
  //       color = const Color(0xFFC5D24A);
  //       break;
  //     case 'dark':
  //       color = const Color(0xFF886958);
  //       break;
  //     case 'fighting':
  //       color = const Color(0xFF9E5A4A);
  //       break;
  //     case 'ghost':
  //       color = const Color(0xFF7774CF);
  //       break;
  //     case 'steel':
  //       color = const Color(0xFFC3C3D9);
  //       break;
  //     case 'flying':
  //       color = const Color(0xFF81A2F8);
  //       break;
  //     case 'fairy':
  //       color = const Color(0xFFEEB0FA);
  //       break;
  //     default:
  //       color = ThemeColors.black1;
  //       break;
  //   }

  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 4.w),
  //     child: Container(
  //       padding: EdgeInsets.all(8.h),
  //       decoration: BoxDecoration(
  //         color: color,
  //         borderRadius: BorderRadius.all(Radius.circular(8.r)),
  //       ),
  //       child: Text(
  //         type.toUpperCase(),
  //         style: const TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //   );
  // }
}
