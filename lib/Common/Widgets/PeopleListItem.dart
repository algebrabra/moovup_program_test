import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:moovup_program_test/Models/PeopleAPIModel.dart';

class PeopleListItem extends StatelessWidget {
  final bool showEmail;
  final bool showArrow;
  final PersonModel userModel;

  const PeopleListItem(
      {super.key, this.showEmail = true, this.showArrow = true, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      height: 120,
      child: Row(
        key: Key('${userModel.name?.first ?? ""} + ${userModel.name?.last ?? ""}'),
        children: [
          (userModel.picture != null && userModel.picture!.isNotEmpty) ? CircleAvatar(
            radius: 40,
            foregroundImage: Image.network(
              userModel.picture!, errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Image.asset('assets/images/no_human.jpg');
            },).image,
          ) : Container(width: 80,),
          Container(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: showEmail
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${userModel.name?.first ?? ""} ${userModel.name?.last ?? ""}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                showEmail
                    ? TextButton(
                        onPressed: () async {
                          if (userModel.email?.isNotEmpty ?? false) {
                            Uri emailLaunchUri = Uri(
                              scheme: "mailto",
                              path: userModel.email!,
                              queryParameters: {},
                            );
                            await launchUrl(emailLaunchUri);
                          }
                        },
                        style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Text(
                          userModel.email ?? "",
                          softWrap: true,
                          style: const TextStyle(fontSize: 12),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          showArrow ? const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ) : Container(width: 20,),
        ],
      ),
    );
  }
}
