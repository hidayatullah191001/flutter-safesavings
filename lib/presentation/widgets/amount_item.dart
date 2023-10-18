part of 'widgets.dart';

class AmountItem extends StatelessWidget {
  final String amount;
  final AmountType type;
  const AmountItem(
      {Key? key, this.amount = '0', this.type = AmountType.pemasukan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              (type == AmountType.pemasukan)
                  ? Icons.south_west
                  : Icons.north_east,
              size: 15,
              color: (type == AmountType.pemasukan)
                  ? AppColor.greenColor
                  : AppColor.redColor,
            ),
            Text(
              (type == AmountType.pemasukan) ? 'Pemasukan' : 'Pengeluaran',
              style: AppTheme.blackTextStyle,
            ),
          ],
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            AppMethods.currency(amount),
            style: (type == AmountType.pemasukan)
                ? AppTheme.greenTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: AppTheme.bold,
                  )
                : AppTheme.redTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: AppTheme.bold,
                  ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: (type == AmountType.pemasukan)
              ? CustomButton(
                  title: 'Lihat',
                  onTap: () {},
                  type: ButtonType.green,
                  padding: 5,
                )
              : CustomButton(
                  title: 'Lihat',
                  onTap: () {},
                  type: ButtonType.red,
                  padding: 5,
                ),
        )
      ],
    );
  }
}

class AmountItemShimmer extends StatelessWidget {
  const AmountItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Row(
            children: [
              const Icon(
                Icons.south_west,
                size: 15,
              ),
              Text(
                'Pemasukan',
                style: AppTheme.blackTextStyle,
              ),
            ],
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              AppMethods.currency('0'),
              style: AppTheme.greyTextStyle.copyWith(
                fontSize: 20,
                fontWeight: AppTheme.bold,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Center(
            child: CustomButton(
              title: '+ Tambah',
              onTap: () {},
              type: ButtonType.red,
              padding: 5,
            ),
          ),
        )
      ],
    );
  }
}
