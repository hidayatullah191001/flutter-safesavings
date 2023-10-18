Folder ini berisi assets seperti image

### Commentan Desain UI Halaman Home Page

// return BlocBuilder<AuthBloc, AuthState>(
// builder: (context, state) {
// if (state is AuthSuccess) {
// print('photo profile ${state.user.profilePhotoUrl}');
    //       return SafeArea(
    //         child: CustomScrollView(
    //           controller: _scrollController,
    //           slivers: [
    //             SliverAppBar(
    //               expandedHeight: 250.0,
    //               floating: false,
    //               pinned: true,
    //               elevation: _isScrolled ? 4 : 0,
    //               backgroundColor: _isScrolled
    //                   ? AppColor.backgroundColor
    //                   : Colors.transparent,
    //               title: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         'Hi,',
    //                         style: _isScrolled
    //                             ? AppTheme.blackTextStyle.copyWith(
    //                                 fontSize: 14,
    //                               )
    //                             : AppTheme.whiteTextStyle.copyWith(
    //                                 fontSize: 14,
    //                               ),
    //                       ),
    //                       Text(
    //                         state.user.name.toString(),
    //                         style: _isScrolled
    //                             ? AppTheme.blackTextStyle.copyWith(
    //                                 fontSize: 14,
    //                                 fontWeight: AppTheme.bold,
    //                               )
    //                             : AppTheme.whiteTextStyle.copyWith(
    //                                 fontSize: 16,
    //                                 fontWeight: AppTheme.bold,
    //                               ),
    //                       ),
    //                     ],
    //                   ),
    //                   CircleAvatar(
    //                     radius: 20,
    //                     backgroundImage: NetworkImage(
    //                       '${state.user.profilePhotoUrl}',
// ),
// )
// ],
// ),
// flexibleSpace: FlexibleSpaceBar(
// background: Container(
// height: 200,
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(25),
// bottomRight: Radius.circular(25),
// ),
// image: DecorationImage(
// image: AssetImage(AppAsset.homeBackground),
// fit: BoxFit.cover,
// ),
// ),
// child: Padding(
// padding: const EdgeInsets.only(
// top: 80, left: 12, right: 12, bottom: 25),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Expanded(
// child: Card(
// elevation: 0,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15),
// ),
// child: Padding(
// padding: const EdgeInsets.symmetric(
// vertical: 15,
// horizontal: 10,
// ),
// child: BlocProvider(
// create: (context) => TransactionBloc()
// ..add(TransactionGetTotalAmount()),
// child: BlocBuilder<TransactionBloc,
// TransactionState>(
// builder: (context, state) {
// if (state is TransactionSuccessAmount) {
// return AmountItem(
// amount:
// state.amount['total_pemasukan'],
// type: AmountType.pemasukan,
// );
// }
// return const AmountItemShimmer();
// },
// ),
// ),
// ),
// ),
// ),
// Expanded(
// child: Card(
// elevation: 0,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15),
// ),
// child: Padding(
// padding: const EdgeInsets.symmetric(
// vertical: 15,
// horizontal: 10,
// ),
// child: BlocProvider(
// create: (context) => TransactionBloc()
// ..add(TransactionGetTotalAmount()),
// child: BlocBuilder<TransactionBloc,
// TransactionState>(
// builder: (context, state) {
// if (state is TransactionSuccessAmount) {
// return AmountItem(
// amount: state
// .amount['total_pengeluaran'],
// type: AmountType.pengeluaran,
// );
// }
// return const AmountItemShimmer();
// },
// ),
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// ),
// SliverToBoxAdapter(
// child: Container(
// margin: const EdgeInsets.only(
// left: 12,
// right: 12,
// top: 30,
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Kategori Transaksi',
// style: AppTheme.blackTextStyle.copyWith(
// fontWeight: AppTheme.bold,
// fontSize: 16,
// ),
// ),
// const SizedBox(
// height: 8,
// ),
// SizedBox(
// height: 40,
// width: double.infinity,
// child: BlocProvider(
// create: (context) =>
// CategoryBloc()..add(CategoryGetAllData()),
// child: BlocBuilder<CategoryBloc, CategoryState>(
// builder: (context, state) {
// CategoryModel manualData = CategoryModel(
// id: 0,
// name: 'Semua',
// createdAt: '',
// updatedAt: '');
// if (state is CategorySuccess) {
// List<CategoryModel> combinedData =
// List.from(state.categoryModel);
// combinedData.insert(0, manualData);
// return ListView.builder(
// shrinkWrap: true,
// scrollDirection: Axis.horizontal,
// itemCount: combinedData.length,
// itemBuilder: (ctx, index) {
// return CategoryItem(
// data: combinedData[index],
// index: index,
// isSelected: index == selectedIndex
// ? true
// : false,
// onTap: () {
// setState(() {
// selectedIndex = index;
// });
// },
// );
// },
// );
// }
// return ListView.builder(
// shrinkWrap: true,
// scrollDirection: Axis.horizontal,
// physics: const NeverScrollableScrollPhysics(),
// itemCount: 5,
// itemBuilder: (context, index) {
// return const CategoryItemShimmer();
// },
// );
// },
// ),
// ),
// ),
// const SizedBox(
// height: 15,
// ),
// Text(
// 'Trancastion Terakhir',
// style: AppTheme.blackTextStyle.copyWith(
// fontWeight: AppTheme.bold,
// fontSize: 16,
// ),
// ),
// BlocProvider(
// create: (context) =>
// TransactionBloc()..add(TransactionGetAllData()),
// child: BlocBuilder<TransactionBloc, TransactionState>(
// builder: (context, state) {
// if (state is TransactionSuccess) {
// return Column(
// children: state.transactionModel
// .map((transaction) => TransactionItem(
// data: transaction,
// ))
// .toList(),
// );
// }
// return ListView.builder(
// shrinkWrap: true,
// itemCount: 5,
// itemBuilder: (context, index) {
// return const TransactionItemShimmer();
// },
// );
// },
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// );
// }
// return Container();
// },
// );
