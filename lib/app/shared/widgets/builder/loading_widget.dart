import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  final bool? isError;
  final dynamic data;
  final bool isWithDecor;
  final Widget? child;
  final Widget? emptyChild;
  final Widget? errorChild;
  final Widget? loadingWidget;
  final bool isCanLoadMore;
  const LoadingWidget(
      {super.key,
      required this.isLoading,
      this.data,
      this.isWithDecor = false,
      this.child,
      this.emptyChild,
      this.loadingWidget,
      this.isCanLoadMore = false,
      this.isError,
      this.errorChild});

  @override
  Widget build(BuildContext context) {
    Widget empty = const Center(
      child: Text(
        'Data Kosong',
        style: TextStyle(color: Colors.grey, fontSize: 17),
      ),
    );

    Widget error = const Center(
      child: Text(
        'Maaf ada sedikit masalah',
        style: TextStyle(color: Colors.grey, fontSize: 17),
      ),
    );

    Widget loading = Center(
      child: Container(
          padding: const EdgeInsets.all(24),
          decoration: !isWithDecor
              ? const BoxDecoration()
              : BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 4, spreadRadius: 2)]),
          child: const CircularProgressIndicator()),
    );

    if (isLoading) {
      if (isCanLoadMore) {
        if (data is List && data.length > 1) {
          return child ?? const SizedBox();
        } else {
          return loading;
        }
      } else {
        if (loadingWidget != null) {
          return loadingWidget!;
        } else {
          return loading;
        }
      }
    } else {
      if (isError != null && isError!) {
        return errorChild ?? error;
      } else {
        if (data != null) {
          if (data is List && data.length < 1) {
            return emptyChild ?? empty;
          } else {
            if (isWithDecor) {
              return const SizedBox();
            } else {
              return child ?? const SizedBox();
            }
          }
        } else {
          return errorChild ?? error;
        }
      }
    }
  }
}
