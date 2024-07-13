import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/post/models/post_model.dart';

class PostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addPost(PostModel postmodel) async {
    final docRef = _db.collection('posts').doc();

    final newPost = PostModel(
      id: docRef.id,
      authorId: postmodel.authorId,
      content: postmodel.content,
      mood: postmodel.mood,
      createDttm: postmodel.createDttm,
    );

    await docRef.set(newPost.toJson());
  }

  Stream<List<PostModel>> getPosts(String uid) {
    return _db
        .collection('posts')
        .where('authorId', isEqualTo: uid)
        .orderBy('createDttm', descending: true)
        .snapshots()
        .map(
      (snapshots) {
        return snapshots.docs
            .map((doc) => PostModel.fromJson(doc.data()))
            .toList();
      },
    );
  }

  Future<void> deletePost(String postId) async {
    await _db.collection('posts').doc(postId).delete();
  }
}

final postRepo = Provider((ref) => PostRepository());
