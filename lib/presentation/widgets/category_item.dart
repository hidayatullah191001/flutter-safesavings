part of 'widgets.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final CategoryModel data;
  final bool isSelected;
  final VoidCallback onTap;
  const CategoryItem({
    Key? key,
    this.index = 0,
    required this.data,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        margin: EdgeInsets.only(left: index != 0 ? 3 : 0, right: 3),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            data.name.toString(),
            style: isSelected
                ? AppTheme.whiteTextStyle
                : AppTheme.primaryTextStyle,
          ),
        ),
      ),
    );
  }
}

class CategoryItemShimmer extends StatelessWidget {
  const CategoryItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        margin: const EdgeInsets.only(right: 3),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            '',
            style: AppTheme.primaryTextStyle,
          ),
        ),
      ),
    );
  }
}
