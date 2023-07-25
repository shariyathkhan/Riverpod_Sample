import 'package:flutter/material.dart';
import 'package:flutter_ar/features/dashboard/persentation/screens/dashboard_large_screen.dart';
import 'package:flutter_ar/features/dashboard/persentation/screens/dashboard_small_screen.dart';
import 'package:flutter_ar/shared/connectivity/network_services.dart';
import 'package:flutter_ar/shared/widget/app_loading.dart';
import 'package:flutter_ar/shared/widget/network_disconnected.dart';
import 'package:flutter_ar/utils/colors.dart';
import 'package:flutter_ar/utils/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../providers/dashboard_provider.dart';
import '../providers/state/dashboard_model.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});

  @override
  ConsumerState<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      if (sizingInformation.isDesktop) {
        return const DashBoardLargeScreen();
      } else if (sizingInformation.isTablet) {
        return const DashBoardSmallScreen();
      } else {
        return const DashBoardSmallScreen();
      }
    });
  }
}
