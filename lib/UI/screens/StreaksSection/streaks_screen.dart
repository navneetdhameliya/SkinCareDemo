import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skincaredemo/UI/common_widgets/common_button.dart';
import 'package:skincaredemo/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:skincaredemo/infrastructure/commons/constants/app_constants.dart';
import 'package:skincaredemo/infrastructure/commons/constants/color_constants.dart';
import 'package:skincaredemo/infrastructure/commons/constants/get_mediaquery.dart';

import 'streaks_controller.dart';

class StreaksScreen extends GetView<StreaksController> {
  const StreaksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StreaksController>(
        init: StreaksController(),
        builder: (StreaksController controller) {
          return Scaffold(
            backgroundColor: ColorConstants.primaryColor,
            appBar: AppBar(
              backgroundColor: ColorConstants.primaryColor,
              title: const HeadlineBodyOneBaseWidget(
                title: 'Streaks',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              centerTitle: true,
            ),
            body: SizedBox(
              width: displayWidth(context),
              height: displayHeight(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadlineBodyOneBaseWidget(
                    title: 'Today\'s Goal: 3 streak days',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorConstants.secondaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(24),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadlineBodyOneBaseWidget(
                          title: AppConstants.streakDay,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        HeadlineBodyOneBaseWidget(
                          title: controller.streaks.value.toString(),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HeadlineBodyOneBaseWidget(
                    title: AppConstants.dailyStreak,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  HeadlineBodyOneBaseWidget(
                    title: controller.streaks.value.toString(),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeadlineBodyOneBaseWidget(
                        title: 'Last 30 Days',
                        titleColor: ColorConstants.textColor,
                        fontSize: 16,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      HeadlineBodyOneBaseWidget(
                        title: '+100%',
                        titleColor: ColorConstants.positiveColor,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Expanded(child: IndependentAxesChart()),
                  const SizedBox(
                    height: 24,
                  ),
                  HeadlineBodyOneBaseWidget(
                    title: AppConstants.keepItUpText,
                    fontSize: 16,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CommonButton(
                    title: AppConstants.getStarted,
                    onTap: () {},
                    buttonColor: ColorConstants.secondaryColor,
                    titleColor: ColorConstants.blackColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ).paddingSymmetric(horizontal: 20),
            ),
          );
        });
  }
}

class IndependentAxesChart extends StatelessWidget {
  const IndependentAxesChart({super.key});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> data = [
      const FlSpot(0, 12),
      const FlSpot(1, 15),
      const FlSpot(2, 10),
      const FlSpot(3, 16),
      const FlSpot(4, 14),
      const FlSpot(5, 11),
      const FlSpot(6, 15),
      const FlSpot(7, 8),
      const FlSpot(8, 17),
      const FlSpot(9, 16),
      const FlSpot(10, 12),
      const FlSpot(11, 14),
      const FlSpot(12, 11),
    ];

    Widget bottomTitleWidgets(double value, TitleMeta meta) {
      const style = TextStyle(
        color: ColorConstants.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 13,
      );
      String text;
      switch (value.toInt()) {
        case 0:
          text = '1d';
          break;
        case 3:
          text = '1w';
          break;
        case 6:
          text = '1m';
          break;
        case 9:
          text = '3m';
          break;
        case 12:
          text = '1y';
          break;
        default:
          return Container();
      }

      return Text(text, style: style, textAlign: TextAlign.left);
    }

    return LineChart(
      LineChartData(
        lineTouchData: const LineTouchData(
          touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: ColorConstants.secondaryColor),
        ),
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 26,
              interval: 1,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        minX: 0,
        maxX: 12,
        minY: 0,
        maxY: 30,
        lineBarsData: [
          LineChartBarData(
            spots: data,
            isCurved: true,
            color: ColorConstants.textColor,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
