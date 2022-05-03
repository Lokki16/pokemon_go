import 'package:pokemon_go/presentation/template/template.dart';

class PokePages {
  int index;

  PokePages(this.index);

  Color backgroundColor = ThemeColors.green1;
  String pokemonElement = 'Jungle';
  List<int> pokemonWildList = [123, 190, 656];
  List<int> pokemonIncenseList = [201, 201, 470, 441, 497, 272];

  void pokePage() {
    switch (index) {
      case 1:
        backgroundColor = ThemeColors.brown1;
        pokemonElement = 'Desert Mountain';
        pokemonWildList = [227, 410, 449];
        pokemonIncenseList = [201, 201, 136, 248, 330, 538];
        break;

      case 2:
        backgroundColor = ThemeColors.blue3;
        pokemonElement = 'Ocean Beach';
        pokemonWildList = [147, 333, 594];
        pokemonIncenseList = [201, 201, 134, 130, 184, 539];
        break;

      case 3:
        backgroundColor = ThemeColors.brown2;
        pokemonElement = 'Cave';
        pokemonWildList = [524, 618, 633];
        pokemonIncenseList = [201, 201, 197, 282, 359, 596];
        break;

      default:
        backgroundColor = ThemeColors.green1;
        pokemonElement = 'Jungle';
        pokemonWildList = [123, 190, 656];
        pokemonIncenseList = [201, 201, 470, 441, 497, 272];
    }
  }
}

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  int index = 0;

  PokePages pokePages = PokePages(0);

  @override
  void initState() {
    pokePages = PokePages(index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PokemonPageLoadSuccess) {
              return Swipe(
                onSwipeLeft: () {
                  index = (index + 1) % 4;
                  pokePages = PokePages(index);
                  pokePages.pokePage();
                  setState(() {});
                },
                onSwipeRight: () {
                  index = (index + 3) % 4;
                  pokePages = PokePages(index);
                  pokePages.pokePage();
                  setState(() {});
                },
                child: SingleChildScrollView(
                  child: Container(
                    color: pokePages.backgroundColor,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(AppRoutes.routeToHome),
                              child: SizedBox(
                                height: 160.h,
                                child: Image.asset('assets/images/image2.png'),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 85.h,
                                      child: Image.asset(
                                          'assets/images/image3.png'),
                                    ),
                                    SizedBox(
                                      height: 85.h,
                                      child: Image.asset(
                                          'assets/images/image4.png'),
                                    ),
                                  ],
                                ),
                                _PokemonElementLabel(
                                  pokemonElement: pokePages.pokemonElement,
                                  backgroundColor: pokePages.backgroundColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const PokemonTypeLabel(text: 'Wild'),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonWithIcon(
                              name: state
                                  .pokemonListings[pokePages.pokemonWildList[0]]
                                  .name,
                              icon: state
                                  .pokemonListings[pokePages.pokemonWildList[0]]
                                  .imageUrl,
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.routeToPokemonDetailsView,
                                  arguments: state
                                      .pokemonListings[
                                          pokePages.pokemonWildList[0]]
                                      .id,
                                );
                              },
                            ),
                            ButtonWithIcon(
                              name: state
                                  .pokemonListings[pokePages.pokemonWildList[1]]
                                  .name,
                              icon: state
                                  .pokemonListings[pokePages.pokemonWildList[1]]
                                  .imageUrl,
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.routeToPokemonDetailsView,
                                  arguments: state
                                      .pokemonListings[
                                          pokePages.pokemonWildList[1]]
                                      .id,
                                );
                              },
                            ),
                            ButtonWithIcon(
                              name: state
                                  .pokemonListings[pokePages.pokemonWildList[2]]
                                  .name,
                              icon: state
                                  .pokemonListings[pokePages.pokemonWildList[2]]
                                  .imageUrl,
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.routeToPokemonDetailsView,
                                  arguments: state
                                      .pokemonListings[
                                          pokePages.pokemonWildList[2]]
                                      .id,
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        const PokemonTypeLabel(
                          text: 'Incense',
                          image: 'assets/images/image11.png',
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ButtonWithIcon(
                                  name: state
                                      .pokemonListings[
                                          pokePages.pokemonIncenseList[0]]
                                      .name,
                                  icon: state
                                      .pokemonListings[
                                          pokePages.pokemonIncenseList[0]]
                                      .imageUrl,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.routeToPokemonDetailsView,
                                      arguments: state
                                          .pokemonListings[
                                              pokePages.pokemonIncenseList[0]]
                                          .id,
                                    );
                                  },
                                ),
                                ButtonWithIcon(
                                  name: state
                                      .pokemonListings[
                                          pokePages.pokemonIncenseList[1]]
                                      .name,
                                  icon: state
                                      .pokemonListings[
                                          pokePages.pokemonIncenseList[1]]
                                      .imageUrl,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.routeToPokemonDetailsView,
                                      arguments: state
                                          .pokemonListings[
                                              pokePages.pokemonIncenseList[1]]
                                          .id,
                                    );
                                  },
                                ),
                                ButtonWithIcon(
                                  name: state
                                      .pokemonListings[
                                          pokePages.pokemonIncenseList[2]]
                                      .name,
                                  icon: state
                                      .pokemonListings[
                                          pokePages.pokemonIncenseList[2]]
                                      .imageUrl,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.routeToPokemonDetailsView,
                                      arguments: state
                                          .pokemonListings[
                                              pokePages.pokemonIncenseList[2]]
                                          .id,
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ButtonWithIcon(
                                  name: state
                                      .pokemonListings[
                                          pokePages.pokemonIncenseList[3]]
                                      .name,
                                  icon: state
                                      .pokemonListings[
                                          pokePages.pokemonIncenseList[3]]
                                      .imageUrl,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.routeToPokemonDetailsView,
                                      arguments: state
                                          .pokemonListings[
                                              pokePages.pokemonIncenseList[3]]
                                          .id,
                                    );
                                  },
                                ),
                                ButtonWithIcon(
                                  name: state
                                      .pokemonListings[
                                          pokePages.pokemonIncenseList[4]]
                                      .name,
                                  icon: state
                                      .pokemonListings[
                                          pokePages.pokemonIncenseList[4]]
                                      .imageUrl,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.routeToPokemonDetailsView,
                                      arguments: state
                                          .pokemonListings[
                                              pokePages.pokemonIncenseList[4]]
                                          .id,
                                    );
                                  },
                                ),
                                ButtonWithIcon(
                                  name: state
                                      .pokemonListings[
                                          pokePages.pokemonIncenseList[5]]
                                      .name,
                                  icon: state
                                      .pokemonListings[
                                          pokePages.pokemonIncenseList[5]]
                                      .imageUrl,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.routeToPokemonDetailsView,
                                      arguments: state
                                          .pokemonListings[
                                              pokePages.pokemonIncenseList[5]]
                                          .id,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        const BottomBar(),
                      ],
                    ),
                  ),
                ),
              );
            }
            if (state is PokemonPageLoadFailed) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class _PokemonElementLabel extends StatelessWidget {
  const _PokemonElementLabel({
    Key? key,
    required this.pokemonElement,
    required this.backgroundColor,
  }) : super(key: key);

  final String pokemonElement;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175.w,
      height: 35.h,
      decoration: BoxDecoration(
        color: ThemeColors.white1,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          pokemonElement,
          style:
              ThemeTextBoldItalic.boldItalic1.copyWith(color: backgroundColor),
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: const BoxDecoration(color: ThemeColors.white2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _IconWithText(
            icon: 'assets/images/image7.png',
            text: '3 Hour Lures',
          ),
          _IconWithText(
            icon: 'assets/images/image8.png',
            text: '1/2 Egg Distance',
          ),
          _IconWithText(
            icon: 'assets/images/image6.png',
            text: 'Snapshot Surprises',
          ),
        ],
      ),
    );
  }
}

class _IconWithText extends StatelessWidget {
  final String icon;
  final String text;

  const _IconWithText({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50.h,
          decoration: const BoxDecoration(
            color: ThemeColors.white2,
            shape: BoxShape.circle,
          ),
          child: Image.asset(icon),
        ),
        SizedBox(width: 5.w),
        SizedBox(
          width: 45.w,
          child: Text(
            text,
            style: ThemeTextBold.bold1,
          ),
        ),
      ],
    );
  }
}
