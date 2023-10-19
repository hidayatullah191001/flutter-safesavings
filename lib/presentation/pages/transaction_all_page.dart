part of 'pages.dart';

class TransactionAllPage extends StatefulWidget {
  const TransactionAllPage({Key? key}) : super(key: key);

  @override
  State<TransactionAllPage> createState() => _TransactionAllPageState();
}

class _TransactionAllPageState extends State<TransactionAllPage> {
  ScrollController _scrollController = ScrollController();
  int currentPage = 1;
  int lastPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    BlocProvider.of<TransactionBloc>(context)
        .add(const TransactionGetAllData(type: ''));
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (currentPage != lastPage) {
        currentPage += 1;
        BlocProvider.of<TransactionBloc>(context)
            .add(FetchDataForNextPageEvent(currentPage, type: ''));
      }
    }
  }

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Konten di Bottom Modal',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Untuk menutup Bottom Modal
                  },
                  child: Text('Tutup Modal'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: AppColor.backgroundColor,
        ),
        title: Column(
          children: [
            Text(
              'Semua Transaksi',
              style: AppTheme.whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: AppTheme.semiBold,
              ),
            ),
            Text(
              'Gulir untuk melihat lebih banyak',
              style: AppTheme.whiteTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => _showBottomModal(context),
            icon: const Icon(Icons.filter_alt),
            color: AppColor.backgroundColor,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: BlocProvider(
            create: (context) =>
                TransactionBloc()..add(const TransactionGetAllData(type: '')),
            child: BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                if (state is TransactionSuccess) {
                  return ListView.builder(
                    itemCount: state.data['transaction'].length,
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return TransactionItem(
                        data: state.data['transaction'][index],
                      );
                    },
                  );
                }
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const TransactionItemShimmer();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
