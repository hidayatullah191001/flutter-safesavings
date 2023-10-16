part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double width;
  final ButtonType type;
  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.width = 0,
    this.type = ButtonType.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width == 0 ? MediaQuery.of(context).size.width * 0.35 : width,
      child: Material(
        color: (type == ButtonType.green)
            ? AppColor.greenColor
            : AppColor.redColor,
        borderRadius: BorderRadius.circular(15),
        elevation: 3,
        shadowColor: (type == ButtonType.green)
            ? const Color.fromRGBO(0, 198, 137, 30)
            : const Color.fromRGBO(198, 0, 0, 0.886),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                title,
                style: AppTheme.whiteTextStyle.copyWith(
                  fontWeight: AppTheme.semiBold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
