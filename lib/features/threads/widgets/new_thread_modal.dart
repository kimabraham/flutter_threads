import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/camera/thread_camera_screen.dart';
import 'package:thread_clone/features/threads/widgets/vertical_line.dart';
import 'package:thread_clone/model/user_model.dart';

class NewThreadModal extends StatefulWidget {
  const NewThreadModal({super.key});

  @override
  State<NewThreadModal> createState() => _NewThreadModalState();
}

class _NewThreadModalState extends State<NewThreadModal> {
  String content = '';
  String? _photoPath;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        content = _textEditingController.value.text;
      });
    });
  }

  void _onTapCamera(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ThreadCameraScreen(),
      ),
    );

    setState(() {
      _photoPath = result;
    });
  }

  void _onTapImageRemove() {
    setState(() {
      _photoPath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            Sizes.size10,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'New thread',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: Text(''),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.grey.shade300,
              height: 1.0,
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  right: Sizes.size15,
                  left: Sizes.size15,
                  top: Sizes.size15,
                  bottom: Sizes.size52,
                ),
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minHeight: 140,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: Sizes.size24,
                                  backgroundImage: NetworkImage(
                                    currentUser.avatarUrl,
                                  ),
                                ),
                                Gaps.v10,
                                const VerticalLine(),
                                Gaps.v10,
                                Opacity(
                                  opacity: 0.5,
                                  child: CircleAvatar(
                                    radius: Sizes.size12,
                                    backgroundImage: NetworkImage(
                                      currentUser.avatarUrl,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gaps.h10,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentUser.username,
                                  style: const TextStyle(
                                    fontSize: Sizes.size16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextField(
                                    controller: _textEditingController,
                                    expands: true,
                                    minLines: null,
                                    maxLines: null,
                                    cursorColor: Colors.blue,
                                    scrollPadding: const EdgeInsets.symmetric(
                                        vertical: Sizes.size96),
                                    decoration: InputDecoration(
                                      hintText: "Start a thread...",
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade400,
                                      ),
                                      border: const UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Gaps.v10,
                                if (_photoPath != null)
                                  Stack(
                                    children: [
                                      Container(
                                        height: 300,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(
                                                File(_photoPath!),
                                              ),
                                            ),
                                            border: Border.all(
                                              color: Colors.grey.shade400,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              Sizes.size15,
                                            )),
                                      ),
                                      Positioned(
                                        top: Sizes.size15,
                                        right: Sizes.size15,
                                        child: GestureDetector(
                                          onTap: _onTapImageRemove,
                                          child: Container(
                                            width: Sizes.size40,
                                            height: Sizes.size40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade600,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                Gaps.v10,
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: Sizes.size48,
                                  ),
                                  child: GestureDetector(
                                    onTap: () => _onTapCamera(context),
                                    child: FaIcon(
                                      FontAwesomeIcons.paperclip,
                                      color: Theme.of(context)
                                          .unselectedWidgetColor,
                                      size: Sizes.size20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size15,
                  vertical: Sizes.size15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Anyone can reply',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Post',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size18),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
