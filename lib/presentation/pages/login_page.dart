part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  login(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      if (password.length < 8) {
        AppMethods.dangerFlushbar(context, 'Password min 8 Char');
      } else if (!EmailValidator.validate(email)) {
        AppMethods.dangerFlushbar(context, 'Masukkan email yang valid');
      } else {
        context.read<AuthBloc>().add(
              AuthLogin(
                SignInFormModel(email: email, password: password),
              ),
            );
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
                context, '/home', (route) => false);
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
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.3,
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Selamat Datang',
                            style: AppTheme.whiteTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: AppTheme.bold,
                            ),
                          ),
                          Text(
                            'Silakan login dengan akun yang telah terdaftar',
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
                                        onTap: () => login(emailController.text,
                                            passwordController.text),
                                        title: 'Login',
                                      ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Belum punya akun? ',
                                    style: AppTheme.blackTextStyle,
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.pushNamed(
                                        context, '/register'),
                                    child: Text(
                                      'Daftar akun!',
                                      style: AppTheme.primaryTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
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
