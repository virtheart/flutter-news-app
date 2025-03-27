import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/app/data/models/article_category_model.dart';

class CategoryComponent extends StatelessWidget {
  final List<ArticleCategoryModel> category;
  const CategoryComponent({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: List.generate(
        category.length,
        (index) => Container(
          padding: EdgeInsets.only(
            left: 4.w,
            top: 4.h,
            bottom: 4.h,
            right: 12.w,
          ),
          height: 40.h,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF0C1923)),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                decoration: const BoxDecoration(
                  color: Color(0xFF0C1923),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.category, color: Colors.white, size: 16.sp),
              ),
              SizedBox(width: 6.w),
              Text(
                category[index].name ?? '',
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}