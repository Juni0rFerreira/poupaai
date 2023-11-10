import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:poupaai/common/constants/app_colors.dart';
import 'package:poupaai/common/constants/app_text_style.dart';
import 'package:poupaai/common/extensions/sizes.dart';
import 'package:poupaai/common/widget/custom_circular_progress_indicator.dart';
import 'package:poupaai/features/home/home_page_controller.dart';
import 'package:poupaai/features/home/home_page_state.dart';
import 'package:poupaai/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  bool get wantKeepAlive => true;
  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;
  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;

  final controller = locator.get<HomePageController>();

  @override
  void initState() {
    super.initState();
    controller.getAllTransaction();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: AppColors.greenGradient),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(500, 30),
                    bottomRight: Radius.elliptical(500, 30),
                  )),
              height: 287.h,
            ),
          ),
          Positioned(
            left: 24.0,
            right: 24.0,
            top: 74.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Goof Afternoon,",
                      textScaleFactor: textScaleFactor,
                      style: AppTextStyles.smallText.apply(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      "Enjelin Morgeana",
                      textScaleFactor: textScaleFactor,
                      style: AppTextStyles.mediumText20.apply(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 8.w,
                  ),
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                      color: AppColors.white.withOpacity(0.06)),
                  child: Stack(
                    alignment: const AlignmentDirectional(0.5, -0.5),
                    children: [
                      const Icon(
                        Icons.notifications_none_outlined,
                        color: AppColors.white,
                      ),
                      Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: BoxDecoration(
                          color: AppColors.notification,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 24.w,
            right: 24.w,
            top: 155.h,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 32.h,
              ),
              decoration: const BoxDecoration(
                color: AppColors.darkGreen,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Balance",
                            textScaleFactor: textScaleFactor,
                            style: AppTextStyles.mediumText16w600
                                .apply(color: AppColors.white),
                          ),
                          Text(
                            "R\$ 1.556.00",
                            textScaleFactor: textScaleFactor,
                            style: AppTextStyles.mediumText30
                                .apply(color: AppColors.white),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => log("options"),
                        child: PopupMenuButton(
                          padding: EdgeInsets.zero,
                          child: const Icon(
                            Icons.more_horiz,
                            color: AppColors.white,
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              height: 24.0,
                              child: Text("item 1"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 36.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.06),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: AppColors.white,
                              size: iconSize,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Income",
                                textScaleFactor: textScaleFactor,
                                style: AppTextStyles.mediumText16w500
                                    .apply(color: AppColors.white),
                              ),
                              Text(
                                "R\$ 1.840.00",
                                textScaleFactor: textScaleFactor,
                                style: AppTextStyles.mediumText20
                                    .apply(color: AppColors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.06),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: AppColors.white,
                              size: iconSize,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expenses",
                                textScaleFactor: textScaleFactor,
                                style: AppTextStyles.mediumText16w500
                                    .apply(color: AppColors.white),
                              ),
                              Text(
                                "R\$ 284.00",
                                textScaleFactor: textScaleFactor,
                                style: AppTextStyles.mediumText20
                                    .apply(color: AppColors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 387.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transaction History",
                        style: AppTextStyles.mediumText18,
                      ),
                      Text(
                        "See all",
                        style: AppTextStyles.inputLabelText,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, _) {
                        if (controller.state is HomePageLoadingState) {
                          return const CustomCircularProgressIndicator(
                            color: AppColors.green,
                          );
                        }

                        if (controller.state is HomePageErrorState) {
                          return const Center(
                            child: Text("An error has occured."),
                          );
                        }

                        if (controller.transactions.isEmpty) {
                          return const Center(
                            child:
                                Text("There is no transactions at this time."),
                          );
                        }

                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: controller.transactions.length,
                          itemBuilder: (context, index) {
                            final item = controller.transactions[index];

                            final color = item.value.isNegative
                                ? AppColors.outcome
                                : AppColors.income;
                            final value =
                                "R\$ ${item.value.toStringAsFixed(2)}";
                            return ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              leading: Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.antiFlashWhite,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: const Icon(
                                  Icons.monetization_on_outlined,
                                ),
                              ),
                              title: Text(
                                item.title,
                                style: AppTextStyles.mediumText16w500,
                              ),
                              subtitle: Text(
                                DateTime.fromMicrosecondsSinceEpoch(item.date)
                                    .toString(),
                                style: AppTextStyles.smallText13,
                              ),
                              trailing: Text(
                                value,
                                style: AppTextStyles.mediumText18
                                    .apply(color: color),
                              ),
                            );
                          },
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
