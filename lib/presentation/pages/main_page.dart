part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  var _bottomNavIndex = 0;

  final iconList = <IconData>[
    Icons.dashboard,
    Icons.south_west,
    Icons.north_east,
    Icons.line_style_rounded,
  ];

  final titleIcon = <String>['Home', 'Pemasukan', 'Pengeluaran', 'Kategori'];

  final List<Widget> _pages = const [
    HomePage(),
    PemasukanPage(),
    PengeluaranPage(),
    CategoryPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
          children: _pages,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TransactionAddPage(),
          ));
          if (response) {
            setState(() {});
          }
        },
        backgroundColor: AppColor.primaryColor,
        child: const Icon(Icons.add, weight: 3),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          var color = isActive ? AppColor.primaryColor : AppColor.greyColor;
          if (index == 1) {
            color = isActive ? AppColor.greenColor : AppColor.greyColor;
          }
          if (index == 2) {
            color = isActive ? AppColor.redColor : AppColor.greyColor;
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  titleIcon[index],
                  style: GoogleFonts.openSans().copyWith(
                    color: color,
                    fontSize: 9,
                  ),
                  maxLines: 1,
                ),
              ),
            ],
          );
        },
        activeIndex: _bottomNavIndex,
        backgroundColor: AppColor.backgroundColor,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        shadow: const BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 12,
          spreadRadius: 0.5,
          color: AppColor.secondaryColor,
        ),
      ),
    );
  }
}
