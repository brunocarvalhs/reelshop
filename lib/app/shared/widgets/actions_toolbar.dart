import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reelshop/app/shared/utils/tik_tok_icons_icons.dart';
import 'package:reelshop/app/shared/widgets/circle_image_animation.dart';

class ActionsToolbar extends StatelessWidget {
  // Full dimensions of an action
  static double get actionWidgetSize => 60.0;

// The size of the icon showen for Social Actions
  static double get actionIconSize => 35.0;

// The size of the share social icon
  static double get shareActionIconSize => 25.0;

// The size of the profile image in the follow Action
  static double get profileImageSize => 50.0;

// The size of the plus icon under the profile image in follow action
  static double get plusIconSize => 20.0;

  final String numLikes;
  final String numComments;
  final String userPic;

  const ActionsToolbar({
    Key? key,
    required this.numLikes,
    required this.numComments,
    required this.userPic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getFollowAction(
            pictureUrl: userPic,
          ),
          _getSocialAction(
            icon: TikTokIcons.heart,
            title: numLikes,
          ),
          _getSocialAction(
            icon: TikTokIcons.chatBubble,
            title: numComments,
          ),
          _getSocialAction(
            icon: TikTokIcons.reply,
            title: 'Share',
            isShare: true,
          ),
          CircleImageAnimation(
            child: _getMusicPlayerAction(userPic),
          )
        ],
      ),
    );
  }

  Widget _getSocialAction({required String title, required IconData icon, bool isShare = false}) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      width: 60.0,
      height: 60.0,
      child: Column(
        children: [
          Icon(icon, size: isShare ? 25.0 : 35.0, color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 8.0 : 8.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: isShare ? 14.0 : 14.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getFollowAction({required String pictureUrl}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: 60.0,
      height: 60.0,
      child: Stack(
        children: [
          _getProfilePicture(pictureUrl),
          _getPlusIcon(),
        ],
      ),
    );
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((actionWidgetSize / 2) - (plusIconSize / 2)),
      child: Container(
        width: plusIconSize, // plusIconSize = 20.0;
        height: plusIconSize, // plusIconSize = 20.0;
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 43, 84),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }

  Widget _getProfilePicture(userPic) {
    return Positioned(
      left: (actionWidgetSize / 2) - (profileImageSize / 2),
      child: Container(
        padding: const EdgeInsets.all(1.0), // Add 1.0 point padding to create border
        height: profileImageSize, // profileImageSize = 50.0;
        width: profileImageSize, // profileImageSize = 50.0;
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(profileImageSize / 2)),
        // import 'package:cached_network_image/cached_network_image.dart'; at the top to use CachedNetworkImage
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10000.0),
          child: CachedNetworkImage(
            imageUrl: userPic,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  LinearGradient get musicGradient => LinearGradient(
        colors: [Colors.grey[800]!, Colors.grey[900]!, Colors.grey[900]!, Colors.grey[800]!],
        stops: const [0.0, 0.4, 0.6, 1.0],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      );

  Widget _getMusicPlayerAction(userPic) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      width: actionWidgetSize,
      height: actionWidgetSize,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(11.0),
            height: profileImageSize,
            width: profileImageSize,
            decoration:
                BoxDecoration(gradient: musicGradient, borderRadius: BorderRadius.circular(profileImageSize / 2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10000.0),
              child: CachedNetworkImage(
                imageUrl: userPic,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
