part of 'widgets.dart';

class CustomInputForm extends StatelessWidget {
  final String title;
  final bool obsecureText;
  final TextEditingController controller;
  final String hintText;
  const CustomInputForm({
    Key? key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.obsecureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
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
            style: AppTheme.blackTextStyle,
            obscureText: obsecureText,
            validator: (value) => value == '' ? 'Input cannot be null' : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
              hintText: hintText,
              fillColor: AppColor.secondaryColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintStyle: AppTheme.blackTextStyle.copyWith(
                color: const Color(0xffC0C2D1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
