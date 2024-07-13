import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/constants/gaps.dart';
import 'package:my_app/features/home/models/mood_status.dart';
import 'package:my_app/features/join/view_models/user_view_model.dart';
import 'package:my_app/features/post/models/post_model.dart';
import 'package:my_app/features/post/view_models/post_view_model.dart';
import 'package:my_app/widgets/common_appbar.dart';
import 'package:my_app/widgets/common_padding.dart';
import 'package:my_app/widgets/mood_box.dart';
import 'package:my_app/widgets/post_button.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  final ValueNotifier<int?> _selectedContainerIndex = ValueNotifier<int?>(null);
  final ValueNotifier<bool> _hasContent = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _enablePostButton = ValueNotifier<bool>(false);

  final TextEditingController _contentController = TextEditingController();

  void _contentLisener() {
    _hasContent.value = _contentController.text.isNotEmpty;
    _validatePost();
  }

  void _validatePost() {
    _enablePostButton.value =
        _hasContent.value && _selectedContainerIndex.value != null;
  }

  void _onTapMoodBox(int selectedIndex) {
    if (_selectedContainerIndex.value == selectedIndex) {
      _selectedContainerIndex.value = null;
    } else {
      _selectedContainerIndex.value = selectedIndex;
    }
    _validatePost();
  }

  Future<void> _onPressPostButton() async {
    final post = PostModel(
        id: '',
        authorId: ref.read(usersProvider.notifier).getUserUid(),
        content: _contentController.text,
        mood: Mood.values[_selectedContainerIndex.value!].name,
        createDttm: DateTime.now());
    await ref.read(postProvider.notifier).uploadPost(post);
    context.push('/?index=0');
  }

  @override
  void initState() {
    super.initState();
    _enablePostButton.value = false;
    _hasContent.value = false;
    _contentController.addListener(_contentLisener);
  }

  @override
  void dispose() {
    _contentController.removeListener(_contentLisener);
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: const CommonAppbar(showLogoutButton: true),
        body: CommonPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v96,
              Text(
                'How do you feel?',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Gaps.v12,
              SizedBox(
                width: double.infinity,
                height: deviceHeight * 0.2,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  controller: _contentController,
                  textAlignVertical: TextAlignVertical.top,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Gaps.v32,
              Text(
                'What\'s your mood?',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Gaps.v12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  Mood.values.length,
                  (index) {
                    return ValueListenableBuilder<int?>(
                      valueListenable: _selectedContainerIndex,
                      builder:
                          (BuildContext context, int? value, Widget? child) {
                        return GestureDetector(
                          onTap: () => _onTapMoodBox(index),
                          child: MoodBox(
                            mood: Mood.values[index],
                            isSelected:
                                (index == _selectedContainerIndex.value),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Gaps.v48,
              Align(
                alignment: Alignment.center,
                child: ValueListenableBuilder<bool>(
                  valueListenable: _enablePostButton,
                  builder: (context, isEnabled, child) {
                    return PostButton(
                      isEnabled: isEnabled,
                      buttonText: 'Post',
                      onPressed: isEnabled ? _onPressPostButton : null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
