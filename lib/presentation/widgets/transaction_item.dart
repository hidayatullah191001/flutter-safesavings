part of 'widgets.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel data;
  const TransactionItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          data.type == 'Pemasukan'
              ? const CircleAvatar(
                  radius: 23,
                  backgroundColor: AppColor.greenColor,
                  child: Icon(
                    Icons.south_west,
                    color: AppColor.backgroundColor,
                    size: 20,
                  ),
                )
              : const CircleAvatar(
                  radius: 23,
                  backgroundColor: AppColor.redColor,
                  child: Icon(
                    Icons.north_east,
                    color: AppColor.backgroundColor,
                    size: 20,
                  ),
                ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title.toString(),
                style: AppTheme.primaryTextStyle.copyWith(
                  fontWeight: AppTheme.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                AppMethods.currency(data.amount.toString()),
                style: AppTheme.greyTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionItemShimmer extends StatelessWidget {
  const TransactionItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey
                .shade300, // Warna latar belakang saat tidak ada efek shimmer
            highlightColor:
                Colors.grey.shade100, // Warna highlight saat shimmer
            child: CircleAvatar(
              radius: 23,
              backgroundColor: AppColor.greenColor,
              child: Icon(
                Icons.south_west,
                color: AppColor.backgroundColor,
                size: 20,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 15,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Text(''),
                ),
              ),
              const SizedBox(
                height: 5,
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
        ],
      ),
    );
  }
}
