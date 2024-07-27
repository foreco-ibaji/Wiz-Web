import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../style/app_colors.dart';
import '../../style/app_text_styles.dart';
import '../../widget/global_appbar.dart';
import '../../widget/global_text_field.dart';
import 'ai_search_controller.dart';
import 'views/chat_message_view.dart';
import 'views/quick_search_chip.dart';
import 'views/quick_search_section.dart';

class AiSearchView extends GetView<AiSearchController> {
  const AiSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppBar2.normal(
          title: 'AI 검색',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Obx(
            () => ListView(
              shrinkWrap: true,
              children: [
                controller.isInitSearch.value ? aiStartView() : aiSearchView(),
                GlobalSearchField.aiSearch(
                  textController: controller.textController,
                  textStatus: controller.searchStatus,
                  onSubmit: controller.onSubmitted,
                  onChange: controller.onChange,
                ),
                SizedBox(
                  height: 40.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget aiStartView() {
    return Container(
      constraints: BoxConstraints(
        maxHeight:500.w
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60.w,
          ),
          Text(
            '위즈 AI 검색으로\n빠르게 물어보세요',
            style: AppTextStyles.heading2Bold,
          ),
          Text(
            '어떻게 질문해도 위즈가 쓰레기 배출법을 찾아드릴게요',
            style: AppTextStyles.title3Medium.copyWith(color: AppColors.grey5),
          ),
          SizedBox(
            height: 40.w,
          ),
          Wrap(
            runSpacing: 11.w,
            spacing: 11.w,
            children: List.generate(
              AiQuickSearchType.values.length,
              (index) => QuickSearchSection(
                keyword: AiQuickSearchType.values[index].value,
                iconUrl: AiQuickSearchType.values[index].iconUrl,
                onTap: () => controller
                    .onTapQuickSearch(AiQuickSearchType.values[index].value),
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              // QuickSearchChip(AiQuickChip.trash,
              //     onTap: controller.onTapQuickSearch),
              // SizedBox(
              //   width: 6.w,
              // ),
              QuickSearchChip(AiQuickChip.link,
                  onTap: controller.onTapQuickChip),
            ],
          ),
          SizedBox(
            height: 16.w,
          ),
        ],
      ),
    );
  }

  Widget aiSearchView() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 500.w
      ),
      child: ListView.builder(
        shrinkWrap: true,
        controller: controller.scrollController,
        itemCount: controller.chats.length,
        itemBuilder: (context, index) {
          final chat = controller.chats[index];
          if (chat.fromUser == true) {
            return AutoScrollTag(
              key: ValueKey(index),
              controller: controller.scrollController,
              index: index,
              child: Container(
                  alignment: Alignment.centerRight,
                  child: MessageView.mine(chat.message)),
            );
          } else {
            return AutoScrollTag(
              key: ValueKey(index),
              controller: controller.scrollController,
              index: index,
              child: Container(
                  key: controller.chatKeys[index],
                  alignment: Alignment.centerLeft,
                  child: MessageView.ai(chat.message)),
            );
          }
        },
      ),
    );
  }
}
