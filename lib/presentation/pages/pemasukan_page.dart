part of 'pages.dart';

class PemasukanPage extends StatefulWidget {
  const PemasukanPage({Key? key}) : super(key: key);

  @override
  State<PemasukanPage> createState() => _PemasukanPageState();
}

class _PemasukanPageState extends State<PemasukanPage> {
  ScrollController _scrollController = ScrollController();
  int currentPage = 1;
  int lastPage = 1;
  bool onScroll = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    BlocProvider.of<TransactionBloc>(context)
        .add(const TransactionGetAllData(type: 'Pemasukan'));
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (currentPage != lastPage) {
        currentPage += 1;
        BlocProvider.of<TransactionBloc>(context)
            .add(FetchDataForNextPageEvent(currentPage, type: 'Pemasukan'));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is TransactionSuccess) {
              return Column(
                children: [
                  Container(
                    height: 300,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: state.data['transaction'].length,
                      itemBuilder: (context, index) {
                        return TransactionItem(
                          data: state.data['transaction'][index],
                        );
                      },
                    ),
                  )
                ],
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
    );
  }
}
