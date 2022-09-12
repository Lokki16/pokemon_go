import 'package:pokemon_go/presentation/template/template.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoadInProgress) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PokemonPageLoadSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 380.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/image1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ThemeColors.blue1,
                            ThemeColors.blue2,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 30.w),
                                child: Row(
                                  children: [
                                    _SmallIconButton(
                                      icon: 'assets/images/image5.png',
                                      onTap: () => Navigator.of(context)
                                          .pushNamed(AppRoutes.routeToMapPage),
                                    ),
                                    SizedBox(width: 10.w),
                                    _SmallIconButton(
                                      icon: 'assets/images/image6.png',
                                      onTap: () => Navigator.of(context)
                                          .pushNamed(
                                              AppRoutes.routeToPokemonPage),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 180.h,
                                child: Transform.rotate(
                                  angle: 6.3,
                                  child:
                                      Image.asset('assets/images/image9.png'),
                                ),
                              ),
                            ],
                          ),
                          const PokemonTypeLabel(
                            text: 'Eggs',
                            image: 'assets/images/image10.png',
                            isCenter: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ButtonWithIcon(
                                name: state.listOfPokemon[174].name,
                                icon: state.listOfPokemon[174].image,
                                onTap: () {},
                              ),
                              ButtonWithIcon(
                                name: state.listOfPokemon[433].name,
                                icon: state.listOfPokemon[433].image,
                                onTap: () {},
                              ),
                              ButtonWithIcon(
                                name: state.listOfPokemon[531].name,
                                icon: state.listOfPokemon[531].image,
                                onTap: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          const BottomBar(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is PokemonPageLoadFailed) {
              return Center(child: Text(state.error.toString()));
            }
            return const Center(child: Text('smth'));
          },
        ),
      ),
    );
  }
}

class _SmallIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const _SmallIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 54.h,
        child: Container(
          decoration: const BoxDecoration(
            color: ThemeColors.white3,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            icon,
            height: 44.h,
          ),
        ),
      ),
    );
  }
}
