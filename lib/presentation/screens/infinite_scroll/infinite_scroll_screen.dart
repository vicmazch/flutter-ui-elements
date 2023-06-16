import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  final ScrollController ctrlScroll = ScrollController();
  bool isLoading = false;
  bool isMounted = false;

  List<int> imagesIDs = [1,2,3,4,5];

  void addImages() {
    final lastID = imagesIDs.last;
    imagesIDs.addAll(
      [1,2,3,4,5].map((e) => lastID +e,)
    );
  }

  Future loadNextPage() async {
    if(isLoading) return;

    isLoading = true;

    setState(() {
      
    });

    await Future.delayed(const Duration(seconds: 2));

    addImages();
    isLoading = false;

    setState(() {
      
    });

    moveScrollToBottom();

    if( !isMounted ) return;
  }

  Future onRefresh() async {
    isLoading = true;
    setState(() {
      
    });
    await Future.delayed(const Duration(seconds: 2));
    
    if(!mounted) return;

    isLoading = false;
    final lastID = imagesIDs.last;
    imagesIDs.clear();

    imagesIDs.add(lastID+1);

    addImages();
    setState(() {
      
    });

  }

  void moveScrollToBottom() {
    if( ctrlScroll.position.pixels + 150 <= ctrlScroll.position.maxScrollExtent) return;

    ctrlScroll.animateTo(
      ctrlScroll.position.pixels + 120, 
      duration: const Duration(milliseconds:300 ), 
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  void initState() {
    ctrlScroll.addListener(() { 
      if(ctrlScroll.position.pixels + 500 >= ctrlScroll.position.maxScrollExtent) {
        loadNextPage();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    ctrlScroll.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          child: ListView.builder(
            controller: ctrlScroll,
            itemCount: imagesIDs.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${ imagesIDs[index] }/500/300')
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: !isLoading ? FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)) : SpinPerfect(infinite: true, child: const Icon(Icons.refresh_rounded)),
      ),
    );
  }
}