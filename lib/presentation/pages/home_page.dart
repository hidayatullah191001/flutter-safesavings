part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 150) {
        setState(() {
          _isScrolled = true;
        });
      } else {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_isScrolled);
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return SafeArea(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    expandedHeight: 250.0,
                    floating: false,
                    pinned: true,
                    elevation: _isScrolled ? 4 : 0,
                    backgroundColor: _isScrolled
                        ? AppColor.backgroundColor
                        : Colors.transparent,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi,',
                              style: _isScrolled
                                  ? AppTheme.blackTextStyle.copyWith(
                                      fontSize: 14,
                                    )
                                  : AppTheme.whiteTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                            ),
                            Text(
                              state.user.name.toString(),
                              style: _isScrolled
                                  ? AppTheme.blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: AppTheme.bold,
                                    )
                                  : AppTheme.whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: AppTheme.bold,
                                    ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            state.user.profilePhotoUrl.toString(),
                          ),
                        )
                      ],
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          image: DecorationImage(
                            image: AssetImage(AppAsset.homeBackground),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 85, left: 15, right: 15, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 150,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.backgroundColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.south_west,
                                          size: 15,
                                          color: AppColor.greenColor,
                                        ),
                                        Text(
                                          'Pemasukan',
                                          style: AppTheme.blackTextStyle,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      AppMethods.currency('200000'),
                                      style: AppTheme.greenTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: AppTheme.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    CustomButton(
                                      title: '+ Tambah',
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 150,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.backgroundColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.north_east,
                                          size: 15,
                                          color: AppColor.redColor,
                                        ),
                                        Text(
                                          'Pengeluaran',
                                          style: AppTheme.blackTextStyle,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      AppMethods.currency('200000'),
                                      style: AppTheme.redTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: AppTheme.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    CustomButton(
                                      title: '+ Tambah',
                                      onTap: () {},
                                      type: ButtonType.red,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                        Text('Hello World'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.south_west),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.north_east),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
        ),
      ]),
    );
  }
}
