part of 'widgets.dart';

class CardInfo extends StatefulWidget {
  final double totalAmount, totalPemasukan, totalPengeluaran;
  const CardInfo({
    Key? key,
    required this.totalAmount,
    required this.totalPemasukan,
    required this.totalPengeluaran,
  }) : super(key: key);

  @override
  State<CardInfo> createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  bool isAmountHidden = false;

  void toggleAmountVisibility() {
    setState(() {
      isAmountHidden = !isAmountHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: AppTheme.whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: AppTheme.semiBold,
                ),
              ),
              const Icon(
                Icons.more_horiz,
                color: AppColor.backgroundColor,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                isAmountHidden
                    ? 'Rp ***'
                    : AppMethods.currency('${widget.totalAmount}'),
                style: AppTheme.whiteTextStyle.copyWith(
                  fontSize: 26,
                  fontWeight: AppTheme.bold,
                  letterSpacing: 1,
                ),
              ),
              IconButton(
                icon: Icon(
                  isAmountHidden ? Icons.visibility : Icons.visibility_off,
                  color: AppColor.backgroundColor,
                ),
                onPressed: toggleAmountVisibility,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColor.secondaryColor,
                    child: Icon(
                      Icons.arrow_downward,
                      color: AppColor.primaryColor,
                      size: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('Pemasukan', style: AppTheme.whiteTextStyle),
                ],
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColor.secondaryColor,
                    child: Icon(
                      Icons.arrow_upward,
                      color: AppColor.primaryColor,
                      size: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('Pengeluaran', style: AppTheme.whiteTextStyle),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isAmountHidden
                    ? 'Rp ***'
                    : AppMethods.currency('${widget.totalPemasukan}'),
                style: AppTheme.whiteTextStyle.copyWith(
                  fontWeight: AppTheme.semiBold,
                  fontSize: 16,
                  letterSpacing: 0.2,
                ),
              ),
              Text(
                isAmountHidden
                    ? 'Rp ***'
                    : AppMethods.currency('${widget.totalPengeluaran}'),
                style: AppTheme.whiteTextStyle.copyWith(
                  fontWeight: AppTheme.semiBold,
                  fontSize: 16,
                  letterSpacing: 0.2,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CardInfoShimmer extends StatelessWidget {
  const CardInfoShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: AppTheme.whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: AppTheme.semiBold,
                ),
              ),
              const Icon(
                Icons.more_horiz,
                color: AppColor.backgroundColor,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Text(''),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColor.secondaryColor,
                    child: Icon(
                      Icons.arrow_downward,
                      color: AppColor.primaryColor,
                      size: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('Pemasukan', style: AppTheme.whiteTextStyle),
                ],
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColor.secondaryColor,
                    child: Icon(
                      Icons.arrow_upward,
                      color: AppColor.primaryColor,
                      size: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('Pengeluaran', style: AppTheme.whiteTextStyle),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 15,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Text(''),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 15,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Text(''),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
