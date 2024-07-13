import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/config/theme/app_colors.dart';
import 'package:my_app/constants/gaps.dart';
import 'package:my_app/features/main/main_screen.dart';
import 'package:my_app/features/join/repos/authentication_repo.dart';

class CommonAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final bool showLogoutButton;
  const CommonAppbar({
    super.key,
    this.showLogoutButton = false,
  });

  Future<void> _onPressLogout(BuildContext context, WidgetRef ref) async {
    await ref.read(authRepo).logOut();
    context.go(MainScreen.routeUrl);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            FontAwesomeIcons.fire,
            color: Theme.of(context).primaryColor,
          ),
          Gaps.h12,
          Text(
            'MOOD',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Gaps.h12,
          FaIcon(
            FontAwesomeIcons.fire,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      actions: [
        showLogoutButton
            ? TextButton(
                onPressed: () => _onPressLogout(context, ref),
                child: Text(
                  'Logout',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColors.white),
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
