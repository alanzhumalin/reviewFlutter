import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/logic/post_bloc.dart';
import 'package:posts/logic/post_event.dart';
import 'package:posts/logic/post_state.dart';
import 'package:shimmer/shimmer.dart';

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(
          'Posts',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PostLoading) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 70, 70, 70),
                                  borderRadius: BorderRadius.circular(12)),
                              height: 30,
                              width: double.infinity,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 70, 70, 70),
                                  borderRadius: BorderRadius.circular(12)),
                              height: 50,
                              width: double.infinity,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }

          if (state is PostLoaded) {
            final posts = state.posts;

            return RefreshIndicator(
              onRefresh: () async {
                context.read<PostBloc>().add(LoadPost());
              },
              child: ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: posts.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final post = posts[index];

                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            post.body,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }

          return const Center(child: Text('No posts exist'));
        },
      ),
    );
  }
}
