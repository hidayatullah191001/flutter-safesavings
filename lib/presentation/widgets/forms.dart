part of 'widgets.dart';

class CustomInputForm extends StatelessWidget {
  final String title;
  final bool obsecureText;
  final TextEditingController controller;
  final String hintText;
  final bool enabled;
  final TextInputType keyboardType;
  final VoidCallback? onTap;
  final int maxLines;
  FocusNode? focusNode;
  CustomInputForm({
    Key? key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.obsecureText = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.maxLines = 1,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.blackTextStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            focusNode: focusNode,
            onTap: onTap,
            style: AppTheme.blackTextStyle,
            obscureText: obsecureText,
            validator: (value) => value == '' ? 'Input cannot be null' : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              hintText: hintText,
              fillColor: AppColor.secondaryColor,
              isDense: true,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              filled: true,
              enabled: enabled,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintStyle: AppTheme.blackTextStyle.copyWith(
                color: const Color(0xffC0C2D1),
              ),
            ),
            keyboardType: keyboardType,
          ),
        ],
      ),
    );
  }
}
