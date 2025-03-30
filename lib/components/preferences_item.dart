import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreferencesItem extends StatelessWidget {
  final String title; // 标题
  final String? subTitle; // 副标题
  final String? icon; // 图标
  final Widget? trailing; // 尾部小部件
  final bool showDivider; // 是否显示分割线
  final VoidCallback? onTap; // 点击事件

  // 修改构造函数，将showDivider设置为默认显示
  const PreferencesItem(
      {super.key,
      required this.title,
      this.icon,
      this.trailing,
      this.showDivider = true,
      this.subTitle,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 52.r,
            height: 52.r,
            decoration: BoxDecoration(
              color: const Color(0xFF081117),
              borderRadius: BorderRadius.circular(32.r),
            ),
            padding: EdgeInsets.all(14.r),
            child: SvgPicture.asset(
              icon ?? 'assets/icons/ic_nickname.svg', // 默认图标
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                subTitle?? '',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xFF8E9499),
                ),
              ),
            ],
          ),
          const Spacer(),
          trailing ?? const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF8E9499),
          ),
        ],
      ),
    );
  }
}
