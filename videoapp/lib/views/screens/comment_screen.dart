import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:videoapp/constants.dart';
import 'package:videoapp/controllers/comment_controller.dart';
import 'package:timeago/timeago.dart' as tago;
import 'package:videoapp/views/screens/profile_screen.dart';

class CommentScreen extends StatefulWidget {
  final String id;
  const CommentScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();

  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(widget.id);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                      itemCount: commentController.comments.length,
                      itemBuilder: (context, index) {
                        final comment = commentController.comments[index];
                        return ListTile(
                          leading: InkWell(
                            onTap: () => ProfileScreen(uid: comment.uid),
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  NetworkImage(comment.profilePhoto),
                            ),
                          ),
                          title: Row(
                            children: [
                              // Text(
                              //   "${comment.username}  ",
                              //   style: const TextStyle(
                              //     fontSize: 20,
                              //     color: Colors.red,
                              //     fontWeight: FontWeight.w700,
                              //   ),
                              // ),
                              Marquee(
                                text: "${comment.username}  ",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                ),
                                scrollAxis: Axis.horizontal,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                blankSpace: 20.0,
                                velocity: 100.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    tago.format(
                                      comment.datePublished.toDate(),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: textColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${comment.likes.length} thích',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: textColor,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          subtitle: RichText(
                            text: TextSpan(
                              text: comment.comment,
                              style: const TextStyle(
                                  color: Colors.black), // Đặt kiểu cho văn bản
                            ),
                            maxLines: 5, // Giới hạn số dòng hiển thị
                            overflow: TextOverflow
                                .ellipsis, // Hiển thị dấu ba chấm khi văn bản quá dài
                          ),
                          trailing: InkWell(
                            onTap: () =>
                                commentController.likeComment(comment.id),
                            child: Icon(
                              Icons.favorite,
                              size: 25,
                              color: comment.likes
                                      .contains(authController.user.uid)
                                  ? Colors.red
                                  : textColor,
                            ),
                          ),
                        );
                      });
                }),
              ),
              const Divider(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                // height: 300,
                // width: MediaQuery.sizeOf(context).width,
                child: ListTile(
                  title: TextFormField(
                    controller: _commentController,
                    style: const TextStyle(
                      fontSize: 16,
                      color: textColor,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Bình luận',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.w700,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  trailing: TextButton(
                    onPressed: () =>
                        commentController.postComment(_commentController.text),
                    child: const Text(
                      'Gửi',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
