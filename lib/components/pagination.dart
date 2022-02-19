import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fpl/configs/colors.dart';
import 'package:fpl/stores/select_player.dart';
import 'package:provider/provider.dart';

class Pagination extends StatelessWidget {
  const Pagination({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SelectPlayerStore>(context);

    return Observer(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(4.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(4.0),
              onTap: store.prevPage,
              child: _PaginationItem(
                isActive: store.currentPage > 1,
                page: -1,
              ),
            ),
          ),
          if (store.totalPage <= 7)
            ...List.generate(
              store.totalPage,
              (index) => Container(
                margin: const EdgeInsets.all(4.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(4.0),
                  onTap: () {
                    store.changePage(index + 1);
                  },
                  child: _PaginationItem(
                    page: index + 1,
                    isActive: (index + 1 == store.currentPage),
                  ),
                ),
              ),
            ),
          if (store.totalPage > 7 && store.currentPage <= 4) ...[
            ...List.generate(
              5,
              (index) => Container(
                margin: const EdgeInsets.all(4.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(4.0),
                  onTap: () {
                    store.changePage(index + 1);
                  },
                  child: _PaginationItem(
                    page: index + 1,
                    isActive: (index + 1 == store.currentPage),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: const _PaginationItem(
                isActive: true,
                page: -3,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(4.0),
                onTap: () {
                  store.changePage(store.totalPage);
                },
                child: _PaginationItem(
                  isActive: false,
                  page: store.totalPage,
                ),
              ),
            ),
          ],
          if (store.totalPage > 7 &&
              store.totalPage - store.currentPage < 4) ...[
            Container(
              margin: const EdgeInsets.all(4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(4.0),
                onTap: () {
                  store.changePage(1);
                },
                child: const _PaginationItem(
                  isActive: false,
                  page: 1,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: const _PaginationItem(
                isActive: true,
                page: -3,
              ),
            ),
            ...List.generate(
              5,
              (index) => Container(
                margin: const EdgeInsets.all(4.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(4.0),
                  onTap: () {
                    store.changePage(store.totalPage - 4 + index);
                  },
                  child: _PaginationItem(
                    page: store.totalPage - 4 + index,
                    isActive:
                        (store.totalPage - 4 + index == store.currentPage),
                  ),
                ),
              ),
            ),
          ],
          if (store.totalPage > 7 &&
              store.totalPage - store.currentPage >= 4 &&
              store.currentPage > 4) ...[
            Container(
              margin: const EdgeInsets.all(4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(4.0),
                onTap: () {
                  store.changePage(1);
                },
                child: const _PaginationItem(
                  isActive: false,
                  page: 1,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: const _PaginationItem(
                isActive: true,
                page: -3,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(4.0),
                onTap: () {
                  store.changePage(store.currentPage - 1);
                },
                child: _PaginationItem(
                  isActive: false,
                  page: store.currentPage - 1,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(4.0),
                onTap: () {
                  store.changePage(store.currentPage);
                },
                child: _PaginationItem(
                  isActive: true,
                  page: store.currentPage,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(4.0),
                onTap: () {
                  store.changePage(store.currentPage + 1);
                },
                child: _PaginationItem(
                  isActive: false,
                  page: store.currentPage + 1,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: const _PaginationItem(
                isActive: true,
                page: -3,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(4.0),
                onTap: () {
                  store.changePage(store.totalPage);
                },
                child: _PaginationItem(
                  isActive: false,
                  page: store.totalPage,
                ),
              ),
            ),
          ],
          Container(
            margin: const EdgeInsets.all(4.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(4.0),
              onTap: store.nextPage,
              child: _PaginationItem(
                isActive: store.currentPage < store.totalPage,
                page: -2,
              ),
            ),
          ),
        ],
      ),
    );
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
    } else if (page == -3) {
      return Container(
        width: 32.0,
        height: 32.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.grey.shade100 : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text("...")],
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
