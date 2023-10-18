part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  register(String name, String email, String password) {
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      if (password.length < 8) {
        AppMethods.dangerFlushbar(context, 'Password min 8 Char');
      } else if (!EmailValidator.validate(email)) {
        AppMethods.dangerFlushbar(context, 'Masukkan email yang valid');
      } else {
        context.read<AuthBloc>().add(AuthRegister(
              SignUpFormModel(name: name, email: email, password: password),
            ));
      }
    } else {
      AppMethods.dangerFlushbar(context, 'Tidak boleh kosong!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main', (route) => false);
          }
          if (state is AuthFailed) {
            AppMethods.dangerFlushbar(context, state.e);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppAsset.splashBackground,
                    ),
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.2,
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Daftar Akun',
                            style: AppTheme.whiteTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: AppTheme.bold,
                            ),
                          ),
                          Text(
                            'Silakan masukkan data kamu untuk membuat akun baru!',
                            style: AppTheme.secondaryTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 15,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColor.backgroundColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomInputForm(
                                controller: nameController,
                                title: 'Nama Lengkap',
                                hintText: 'Masukkan nama lengkap...',
                              ),
                              CustomInputForm(
                                controller: emailController,
                                title: 'Email',
                                hintText: 'Masukkan email...',
                              ),
                              CustomInputForm(
                                controller: passwordController,
                                title: 'Password',
                                hintText: 'Masukkan password...',
                                obsecureText: true,
                              ),
                              Center(
                                child: state is AuthLoading
                                    ? const CircularProgressIndicator(
                                        color: AppColor.greenColor,
                                      )
                                    : CustomButton(
                                        onTap: () => register(
                                          nameController.text,
                                          emailController.text,
                                          passwordController.text,
                                        ),
                                        title: 'Register',
                                      ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sudah punya akun? ',
                                    style: AppTheme.blackTextStyle,
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: Text(
                                      'Masuk',
                                      style: AppTheme.primaryTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
