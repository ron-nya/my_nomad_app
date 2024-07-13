import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/config/theme/app_colors.dart';
import 'package:my_app/constants/gaps.dart';
import 'package:my_app/features/home/models/mood_post_card_model.dart';
import 'package:my_app/features/home/view_models/home_view_model.dart';
import 'package:my_app/features/join/view_models/user_view_model.dart';
import 'package:my_app/widgets/common_appbar.dart';
import 'package:my_app/widgets/common_padding.dart';
import 'package:my_app/widgets/mood_post_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String routeUrl = '/home';
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void _confirmDeletePost(BuildContext context, WidgetRef ref, String postId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Post'),
          content: const Text('Are you sure you want to delete this post?'),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Delete',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.white),
              ),
              onPressed: () async {
                await ref.read(homeProvider.notifier).deletePost(postId);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Post deleted successfully')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String uid = ref.read(usersProvider.notifier).getUserUid();
    final postStream = ref.watch(homeStreamProvider(uid));
    return SafeArea(
      child: Scaffold(
        appBar: const CommonAppbar(
          showLogoutButton: true,
        ),
        body: postStream.when(
          data: (posts) {
            if (posts.isEmpty) {
              return const Center(child: Text('No posts found.'));
            }
            return CommonPadding(
              child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return Column(
                      children: [
                        Gaps.v16,
                        GestureDetector(
                          onLongPress: () =>
                              _confirmDeletePost(context, ref, post.id),
                          child: MoodPostCard(
                            moodPostCardModel: MoodPostCardModel(
                                autherId: post.authorId,
                                createDttm: post.createDttm,
                                mood: post.mood,
                                content: post.content),
                          ),
                        ),
                      ],
                    );
                  }),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}
