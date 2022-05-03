import 'package:pokemon_go/presentation/template/template.dart';

class ButtonWithIcon extends StatelessWidget {
  final String name;
  final String icon;
  final VoidCallback onTap;

  const ButtonWithIcon({
    Key? key,
    required this.name,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 100.w,
            height: 89.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: ThemeColors.white2,
              image: DecorationImage(
                image: NetworkImage(icon),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(name, style: ThemeTextMedium.medium1),
      ],
    );
  }
}
