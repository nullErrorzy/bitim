import 'package:bit_im/enum/chats_state_enum.dart';
import 'package:bit_im/personalchat/personal_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  void initState() {
    super.initState();
  }

  List<ChatsModel> chatsModels = [
    ChatsModel(
        url: 'assets/images/Frame 3293.svg',
        name: 'Ashish',
        time: '10:30',
        message: 'Good morning, did you sleep well?',
        count: 12,
        state: ChatsStateEnum.online),
    ChatsModel(
        url: 'assets/images/Frame 32931.svg',
        name: 'UX Team',
        time: '15m ago',
        message: 'How is it going?',
        state: ChatsStateEnum.online),
    ChatsModel(
        url: 'assets/images/Frame 32932.svg',
        name: 'Erlan Sadewa',
        time: '1h ago',
        message: 'Aight, noted',
        count: 5),
    ChatsModel(
        url: 'assets/images/Frame 32933.svg',
        name: 'Athalia Putri',
        time: '3m ago',
        message: 'Good morning, did you sleep well?',
        count: 1,
        state: ChatsStateEnum.online),
    ChatsModel(
        url: 'assets/images/Frame 32934.svg',
        name: 'UX Team',
        time: '15m ago',
        message: 'How is it going?'),
    ChatsModel(
        url: 'assets/images/Frame 32935.svg',
        name: 'Erlan Sadewa',
        time: '1h ago',
        message: 'Aight, noted',
        count: 1),
    ChatsModel(
        url: 'assets/images/Frame 32936.svg',
        name: 'Erlan Sadewa',
        time: '1h ago',
        message: 'Aight, noted'),
    ChatsModel(
        url: 'assets/images/Frame 32934.svg',
        name: 'UX Team',
        time: '15m ago',
        message: 'How is it going?',
        count: 50),
    ChatsModel(
        url: 'assets/images/Frame 32935.svg',
        name: 'Erlan Sadewa',
        time: '1h ago',
        message: 'Aight, noted'),
    ChatsModel(
        url: 'assets/images/Frame 32936.svg',
        name: 'Erlan Sadewa',
        time: '1h ago',
        message: 'Aight, noted'),
    ChatsModel(
        url: 'assets/images/Frame 32934.svg',
        name: 'UX Team',
        time: '15m ago',
        message: 'How is it going?')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          // Get.defaultDialog(
          //     onConfirm: () => print("Ok"),
          //     middleText: "Dialog made in 3 lines of code");
          //Get.snackbar("Snackbar 标题", "欢迎使用Snackbar", colorText: Colors.black);
          Get.dialog(
            Center(
                child: Container(
              width: MediaQuery.of(context).size.width * .6,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: DefaultTextStyle(
                style: const TextStyle(color: Colors.black, fontSize: 16),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    const Text('温馨提示',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const Text(
                        '欢迎您使用是APP，请充分阅读知疾《用户协议》和《隐私政策》点“同意并继续“代表您已同意前述协议及下列约定;为了给您提供服务，我们会申请系统权限收集设备及个人信息;工再将严格保守您的个人信息，确保信息安全。您在点击”同意并继续”前，务必审慎阅读，充分理解协议条款内容'),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('同意并继续',
                              style: TextStyle(color: Colors.white))),
                    )
                  ]),
                ),
              ),
            )),
            barrierDismissible: false,
          );
        }),
        body: CustomScrollView(//controller: controller,
            slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Chats'),
            backgroundColor: Color(0x88FFFFFF),
            automaticallyImplyTitle: false,
            brightness: Brightness.light,
            alwaysShowMiddle: false,
          ),
          SliverList.builder(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Get.to(
                      () => PersonalChatPage(name: chatsModels[index].name)),
                  child: DefaultTextStyle(
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                      child: buildWidget(chatsModel: chatsModels[index])),
                );
              },
              itemCount: chatsModels.length)
        ]));
  }
}

buildWidget({required ChatsModel chatsModel}) {
  Widget data = Container(
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      constraints: const BoxConstraints(minHeight: 20, minWidth: 20),
      child: Center(
          child: Text(chatsModel.count.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 12))));
  if (chatsModel.count <= 0) {
    data = const SizedBox();
  }
  return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SvgPicture.asset(chatsModel.url, width: 50, height: 50),
                Container(
                    decoration: BoxDecoration(
                        color: chatsModel.state == ChatsStateEnum.online
                            ? Colors.transparent
                            : Colors.grey.withOpacity(.4),
                        borderRadius: BorderRadius.circular(10)),
                    width: 50,
                    height: 50),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: chatsModel.state == ChatsStateEnum.online
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20)),
                          width: 13,
                          height: 13),
                      Container(
                          decoration: BoxDecoration(
                              color: chatsModel.state == ChatsStateEnum.online
                                  ? const Color(0xff32d877)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20)),
                          width: 11,
                          height: 11),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(children: [
                Row(children: [
                  Expanded(
                      child: Text(chatsModel.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400))),
                  Text(chatsModel.time)
                ]),
                const SizedBox(height: 5),
                Row(children: [
                  Expanded(
                    child: Text(chatsModel.message,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Color(0xffADB5BD))),
                  ),
                  data
                ])
              ]),
            )
          ]));
}

class ChatsModel {
  late String url;
  late String name;
  late String time;
  late String message;
  late int count;
  late ChatsStateEnum state;
  ChatsModel(
      {required this.url,
      this.name = '',
      this.time = '',
      required this.message,
      this.count = 0,
      this.state = ChatsStateEnum.offline});
}
