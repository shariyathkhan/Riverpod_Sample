import 'package:flutter/material.dart';
import 'package:flutter_ar/shared/connectivity/network_services.dart';
import 'package:flutter_ar/shared/widget/app_loading.dart';
import 'package:flutter_ar/shared/widget/network_disconnected.dart';
import 'package:flutter_ar/utils/colors.dart';
import 'package:flutter_ar/utils/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/dashboard_provider.dart';
import '../providers/state/dashboard_model.dart';

class DashBoardSmallScreen extends ConsumerStatefulWidget {
  const DashBoardSmallScreen({super.key});

  @override
  ConsumerState<DashBoardSmallScreen> createState() =>
      _DashBoardSmallScreenState();
}

class _DashBoardSmallScreenState extends ConsumerState<DashBoardSmallScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<UserModel> userList = [];
  List<UserModel> _foundUsers = [];

  void _runFilter(String enteredKeyword) {
    _foundUsers.clear();
    List<UserModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = userList;
    } else {
      results = userList
          .where((user) => user.title
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    var connectivityStatusProvider = ref.watch(connectivityStatusProviders);
    final userData = ref.watch(userDataProvider);

    return Scaffold(
        appBar: _appBar(),
        body: connectivityStatusProvider == ConnectivityStatus.isConnected
            ? userData.when(
                data: (userData) {
                  userList = userData.map((e) => e).toList();
                  return Container(
                    color: AppColors.white,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: TextField(
                                decoration: const InputDecoration(
                                  focusColor: AppColors.primaryColor,
                                  fillColor: AppColors.primaryColor,
                                  hoverColor: AppColors.primaryColor,
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1.0),
                                  ),
                                  hintText: Constants.search,
                                ),
                                onChanged: (text) async {
                                  _runFilter(text);
                                },
                              ),
                            ),
                            _userList(),
                            const SizedBox(
                              height: 6,
                            ),
                          ],
                        )),
                  );
                },
                error: (error, s) => Text(error.toString()),
                loading: () => const AppLoading())
            : const AppError());
  }

  _userList() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, i) {
            return _listItems(i);
          },
          itemCount:
              _foundUsers.isEmpty ? userList.length : _foundUsers.length),
    );
  }

  // listItems
  _listItems(index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: AppColors.grayText, width: 0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _textContent(index),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.favorite,
                  color: userList[index].userId == 2
                      ? AppColors.red
                      : AppColors.greyLightLineColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //_textContent
  _textContent(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 6,
        ),
        Text(userList[index].title.toString().toUpperCase(),
            style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(
          height: 4,
        ),
        Text(userList[index].body.toString(),
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 12, fontWeight: FontWeight.normal)),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }

  // App Bar
  AppBar _appBar() {
    return AppBar(
      title: const Text(Constants.title),
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      actions: [
        _addCartIcon(),
        _notificationIcon(),
      ],
    );
  }

  IconButton _addCartIcon() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.shopping_bag_outlined,
        color: AppColors.white,
        size: 16,
      ),
    );
  }

  //
  IconButton _notificationIcon() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.notifications_active_outlined,
        color: AppColors.white,
        size: 20,
      ),
    );
  }
}
