part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  int selectedIndex = 0;
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          final now = DateTime.now();
          final currentTime = now.hour;
          String greeting = AppMethods.getGreeting(currentTime);
          return SafeArea(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 300,
                    child: _head(state.user, greeting),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      top: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kategori Transaksi',
                          style: AppTheme.blackTextStyle.copyWith(
                            fontWeight: AppTheme.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: BlocProvider(
                            create: (context) =>
                                CategoryBloc()..add(CategoryGetAllData()),
                            child: BlocBuilder<CategoryBloc, CategoryState>(
                              builder: (context, state) {
                                CategoryModel manualData = CategoryModel(
                                    id: 0,
                                    name: 'Semua',
                                    createdAt: '',
                                    updatedAt: '');
                                if (state is CategorySuccess) {
                                  List<CategoryModel> combinedData =
                                      List.from(state.categoryModel);
                                  combinedData.insert(0, manualData);
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: combinedData.length,
                                    itemBuilder: (ctx, index) {
                                      return CategoryItem(
                                        data: combinedData[index],
                                        index: index,
                                        isSelected: index == selectedIndex
                                            ? true
                                            : false,
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                      );
                                    },
                                  );
                                }
                                return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return const CategoryItemShimmer();
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Trancastion Terakhir',
                              style: AppTheme.blackTextStyle.copyWith(
                                fontWeight: AppTheme.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/transaction-all',
                                );
                              },
                              child: Text(
                                'Lihat Semua',
                                style: AppTheme.primaryTextStyle,
                              ),
                            ),
                          ],
                        ),
                        BlocProvider(
                          create: (context) => TransactionBloc()
                            ..add(const TransactionGetAllData(type: '')),
                          child: BlocBuilder<TransactionBloc, TransactionState>(
                            builder: (context, state) {
                              if (state is TransactionSuccess) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.data['transaction'].length,
                                  itemBuilder: (context, index) {
                                    return TransactionItem(
                                      data: state.data['transaction'][index],
                                    );
                                  },
                                );
                              }
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return const TransactionItemShimmer();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _head(UserModel user, String greeting) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                color: AppColor.homeBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: MediaQuery.of(context).size.width * 0.85,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        height: 40,
                        width: 40,
                        color: AppColor.secondaryColor,
                        child: CachedNetworkImage(
                          imageUrl: user.profilePhotoUrl!,
                          placeholder: (context, url) => const Icon(
                              Icons.person,
                              color: AppColor.primaryColor),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat $greeting',
                          style: AppTheme.whiteTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          user.name.toString(),
                          style: AppTheme.whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: AppTheme.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 120,
          left: 37,
          child: Container(
            height: 170,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(155, 42, 50, 125),
                  offset: Offset(0, 8),
                  blurRadius: 12,
                  spreadRadius: 6,
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: AssetImage(
                  AppAsset.homeBackground,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: BlocProvider(
              create: (context) =>
                  TransactionBloc()..add(TransactionGetTotalAmount()),
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionSuccessAmount) {
                    double totalPemasukan =
                        double.parse(state.amount['total_pemasukan']);
                    double totalPengeluaran =
                        double.parse(state.amount['total_pengeluaran']);
                    double totalAmount = totalPemasukan - totalPengeluaran;
                    return CardInfo(
                      totalAmount: totalAmount,
                      totalPemasukan: totalPemasukan,
                      totalPengeluaran: totalPengeluaran,
                    );
                  }
                  return const CardInfoShimmer();
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
