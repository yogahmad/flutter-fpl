import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fpl/configs/colors.dart';

class Pagination extends StatelessWidget {
  const Pagination({
    Key? key,
    required this.page,
    required this.currentPage,
    required this.changePage,
  }) : super(key: key);

  final int page;
  final int currentPage;
  final Function changePage;

  @override
  Widget build(BuildContext context) {
    if (page <= 7) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(4.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(4.0),
              onTap: () {
                if (currentPage == 1) return;
                changePage(currentPage - 1);
              },
              child: _PaginationItem(
                isActive: currentPage > 1,
                page: -1,
              ),
            ),
          ),
          ...List.generate(
            page,
            (index) => Container(
              margin: const EdgeInsets.all(4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(4.0),
                onTap: () {
                  if (index + 1 == currentPage) return;
                  changePage(index + 1);
                },
                child: _PaginationItem(
                  page: index + 1,
                  isActive: (index + 1 == currentPage),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(4.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(4.0),
              onTap: () {
                if (currentPage == page) return;
                changePage(currentPage + 1);
              },
              child: _PaginationItem(
                isActive: currentPage < page,
                page: -2,
              ),
            ),
          ),
        ],
      );
    }
    return Container();
  }
}

class _PaginationItem extends StatelessWidget {
  const _PaginationItem({
    Key? key,
    required this.page,
    required this.isActive,
  }) : super(key: key);

  final int page;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    if (page == -1) {
      return Container(
        width: 32.0,
        height: 32.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.grey.shade100 : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(width: 6.0),
            Icon(
              Icons.arrow_back_ios,
              size: 16.0,
            ),
          ],
        ),
      );
    } else if (page == -2) {
      return Container(
        width: 32.0,
        height: 32.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.grey.shade100 : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.arrow_forward_ios,
              size: 16.0,
            ),
          ],
        ),
      );
    }
    return Container(
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(4.0),
        border: isActive
            ? Border.all(
                color: ThemeColors.main,
                width: 2.0,
              )
            : null,
      ),
      child: Center(
        child: Text(
          "$page",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isActive ? ThemeColors.main : ThemeColors.blackText,
          ),
        ),
      ),
    );
  }
}

// x 2 3 4 5 . 10
// 1 x 3 4 5 . 10
// 1 2 x 4 5 . 10
// 1 2 3 x 5 . 10
// 1 . 4 x 6 . 10
// 1 . 5 x 7 . 10
// 1 . 6 x 8 9 10
// 1 . 6 7 x 9 10
// 1 . 6 7 8 x 10
// 1 . 6 7 8 9 x
