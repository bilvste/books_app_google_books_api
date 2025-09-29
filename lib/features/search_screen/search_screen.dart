import 'dart:async';

import 'package:books_app/core/routing/app_routes.dart';
import 'package:books_app/features/search_screen/cubit/search_cubit.dart';
import 'package:books_app/features/search_screen/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<SearchCubit>().searchBooks(query);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Search books...",
                border: OutlineInputBorder(),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return const Center(child: Text("Type to search..."));
                } else if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchLoaded) {
                  if (state.books.isEmpty) {
                    return const Center(child: Text("No results found."));
                  }
                  return ListView.builder(
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      final book = state.books[index];
                      final volumeInfo = book.volumeInfo;

                      final thumbnail = volumeInfo?.imageLinks?.thumbnail;
                      final title = volumeInfo?.title ?? "No Title";
                      final author = (volumeInfo?.authors?.isNotEmpty ?? false)
                          ? volumeInfo!.authors!.first
                          : "Unknown Author";

                      return InkWell(
                        onTap: () {
                          context.pushNamed(
                            AppRoutes.bookDetailsScreen,
                            extra: book,
                          );
                        },
                        child: ListTile(
                          leading: thumbnail != null
                              ? Image.network(
                                  thumbnail,
                                  width: 50,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.book),
                          title: Text(title),
                          subtitle: Text(author),
                        ),
                      );
                    },
                  );
                } else if (state is SearchError) {
                  return Center(child: Text("Error: ${state.message}"));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
