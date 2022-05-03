import 'package:pokemon_go/presentation/template/template.dart';

class PokemonTypeLabel extends StatelessWidget {
  final String text;
  final String? image;
  final bool isCenter;

  const PokemonTypeLabel({
    Key? key,
    required this.text,
    this.isCenter = false,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 32.h,
          width: double.infinity,
          decoration: const BoxDecoration(color: ThemeColors.transparent2),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Align(
              alignment: isCenter ? Alignment.center : Alignment.centerLeft,
              child: Text(
                text,
                style: ThemeTextBoldItalic.boldItalic1,
              ),
            ),
          ),
        ),
        if (image != null)
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: SizedBox(
                height: 63.h,
                child: Transform.rotate(
                  angle: 6.3,
                  child: Image.asset(image!),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
