part of 'pages.dart';

class TransactionAddPage extends StatefulWidget {
  const TransactionAddPage({Key? key}) : super(key: key);

  @override
  State<TransactionAddPage> createState() => _TransactionAddPageState();
}

class _TransactionAddPageState extends State<TransactionAddPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController tipeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  int idCategorySelected = 0;
  final TextEditingController amountController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final scrollController = ScrollController();

  saveData() {
    if (titleController.text.isNotEmpty &&
        tipeController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        idCategorySelected != 0 &&
        amountController.text.isNotEmpty) {
      context.read<TransactionBloc>().add(
            TransactionPostNewData(
              TransactionForm(
                categoryId: idCategorySelected,
                type: tipeController.text,
                title: titleController.text,
                description: descriptionController.text,
                amount: amountController.text,
                transactionDate: dateController.text,
              ),
            ),
          );
    } else {
      AppMethods.dangerFlushbar(context, 'Tidak boleh kosong!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: BlocConsumer<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            DInfo.dialogSuccess(context, 'Data transaction berhasil disimpan');
            DInfo.closeDialog(context,
                durationBeforeClose: const Duration(seconds: 4));
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            });
          }
          if (state is TransactionFailed) {
            AppMethods.dangerFlushbar(context, state.e);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back),
                                color: AppColor.backgroundColor,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Tambah Transaction',
                                    style: AppTheme.whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: AppTheme.semiBold,
                                    ),
                                  ),
                                  Text(
                                    'Buat transaksi baru kamu disini',
                                    style: AppTheme.whiteTextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 100,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.8,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.backgroundColor,
                    ),
                    child: KeyboardVisibilityBuilder(
                      builder: (context, isVisible) {
                        return SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomInputForm(
                                  controller: titleController,
                                  title: 'Nama Transaksi',
                                  hintText: '',
                                ),
                                CustomInputForm(
                                  controller: dateController,
                                  title: 'Tanggal Transaksi',
                                  hintText: '',
                                  keyboardType: TextInputType.none,
                                  onTap: () async {
                                    DateTime? result = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2023, 01, 01),
                                      lastDate:
                                          DateTime(DateTime.now().year + 1),
                                    );
                                    if (result != null) {
                                      setState(() {
                                        dateController.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(result);
                                      });
                                    }
                                  },
                                ),
                                CustomInputForm(
                                  controller: tipeController,
                                  title: 'Tipe Transaksi',
                                  hintText: '',
                                  keyboardType: TextInputType.none,
                                  onTap: () async {
                                    String result = await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SimpleDialog(
                                          title: Text(
                                            'Pilih Opsi',
                                            style: AppTheme.blackTextStyle
                                                .copyWith(
                                              fontSize: 18,
                                              fontWeight: AppTheme.bold,
                                            ),
                                          ),
                                          children: <Widget>[
                                            SimpleDialogOption(
                                              onPressed: () {
                                                Navigator.pop(
                                                    context, 'Pemasukan');
                                              },
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 10,
                                                    backgroundColor:
                                                        AppColor.greenColor,
                                                    child: Icon(
                                                      Icons.arrow_upward,
                                                      color: AppColor
                                                          .secondaryColor,
                                                      size: 12,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Pemasukan',
                                                    style:
                                                        AppTheme.blackTextStyle,
                                                  )
                                                ],
                                              ),
                                            ),
                                            SimpleDialogOption(
                                              onPressed: () {
                                                Navigator.pop(
                                                    context, 'Pengeluaran');
                                              },
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 10,
                                                    backgroundColor:
                                                        AppColor.redColor,
                                                    child: Icon(
                                                      Icons.arrow_downward,
                                                      color: AppColor
                                                          .secondaryColor,
                                                      size: 12,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Pengeluaran',
                                                    style:
                                                        AppTheme.blackTextStyle,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (result != null) {
                                      setState(() {
                                        tipeController.text = result;
                                      });
                                    }
                                  },
                                ),
                                CustomInputForm(
                                  controller: descriptionController,
                                  title: 'Deskripsi Transaksi',
                                  hintText: '',
                                  maxLines: 4,
                                ),
                                CustomInputForm(
                                  controller: categoryController,
                                  title: 'Category Transaksi',
                                  hintText: '',
                                  keyboardType: TextInputType.none,
                                  onTap: () async {
                                    Map? result = await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BlocProvider(
                                          create: (ctx) => CategoryBloc()
                                            ..add(CategoryGetAllData()),
                                          child: BlocBuilder<CategoryBloc,
                                              CategoryState>(
                                            builder: (ctx, state) {
                                              if (state is CategorySuccess) {
                                                return SimpleDialog(
                                                  title: Text(
                                                    'Pilih Opsi Kategori',
                                                    style: AppTheme
                                                        .blackTextStyle
                                                        .copyWith(
                                                      fontSize: 18,
                                                      fontWeight: AppTheme.bold,
                                                    ),
                                                  ),
                                                  children: state.categoryModel
                                                      .map(
                                                        (category) =>
                                                            SimpleDialogOption(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                              context,
                                                              {
                                                                'id':
                                                                    category.id,
                                                                'name': category
                                                                    .name,
                                                              },
                                                            );
                                                          },
                                                          child: Text(
                                                            category.name
                                                                .toString(),
                                                            style: AppTheme
                                                                .blackTextStyle,
                                                          ),
                                                        ),
                                                      )
                                                      .toList(),
                                                );
                                              }
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: AppColor.greenColor,
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                    if (result != null) {
                                      setState(() {
                                        categoryController.text =
                                            result['name'];
                                        idCategorySelected = result['id'];
                                      });
                                    }
                                    print(
                                        'Id Category Selected : $idCategorySelected');
                                  },
                                ),
                                CustomInputForm(
                                  controller: amountController,
                                  title: 'Jumlah Transaksi',
                                  hintText: '',
                                  keyboardType: TextInputType.number,
                                ),
                                Center(
                                  child: state is TransactionLoading
                                      ? const CircularProgressIndicator(
                                          color: AppColor.greenColor,
                                        )
                                      : CustomButton(
                                          title: 'Simpan Data',
                                          onTap: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              saveData();
                                            }
                                          },
                                        ),
                                ),
                                SizedBox(
                                  height: isVisible
                                      ? MediaQuery.of(context).size.height * 0.3
                                      : 30,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
