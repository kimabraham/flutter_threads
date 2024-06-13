import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';

class ThreadItemImage extends StatelessWidget {
  final List<String> imageUrls;

  const ThreadItemImage({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imageUrls.isNotEmpty && imageUrls.length == 1) _buildSingleImage(),
        if (imageUrls.isNotEmpty && imageUrls.length > 1) _buildImageCarousel()
      ],
    );
  }

  SizedBox _buildImageCarousel() {
    return SizedBox(
      height: 220,
      child: PageView.builder(
        controller: PageController(
          viewportFraction: 0.95,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          var imageUrl = imageUrls[index];

          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 0 : Sizes.size5,
              right: index == imageUrl.length - 1 ? 0 : Sizes.size5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Sizes.size10,
              ),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            clipBehavior: Clip.hardEdge,
          );
        },
        clipBehavior: Clip.none,
      ),
    );
  }

  Container _buildSingleImage() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
        child: Image(
          image: NetworkImage(
            imageUrls.first,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
