part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Timer(
              const Duration(seconds: 3),
              () => Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false),
            );
          }
          if (state is AuthFailed) {
            Timer(
              const Duration(seconds: 3),
              () => Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false),
            );
          }
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppAsset.splashBackground,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Image.asset(
              AppAsset.logoName,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
        ),
      ),
    );
  }
}
