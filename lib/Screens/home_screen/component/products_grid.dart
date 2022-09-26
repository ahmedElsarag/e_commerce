import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../cubit/home_cubit.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
          gridDelegate:
          const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            childAspectRatio: .6,
          ),
          delegate: SliverChildBuilderDelegate((context,
              index) =>
              Card(
                elevation: 0,
                color: Colors.transparent,
                child: Column(
                  children: [
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                          height: 25.h,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  (HomeCubit.get(context)
                                      .homeResponse
                                      ?.data
                                      ?.products?[index]
                                      ?.image)!),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          8, 8, 0, 0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Container(
                                width:30.w,
                                child: Text((HomeCubit.get(context)
                                    .homeResponse
                                    ?.data
                                    ?.products?[index]
                                    ?.name)!,maxLines: 1,overflow: TextOverflow.fade,),
                              ),
                              Text(
                                '\$${(HomeCubit.get(context).homeResponse?.data?.products?[index]?.price)!}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: (HomeCubit.get(context)
                                .homeResponse
                                ?.data
                                ?.products?[index]
                                ?.isFav)!
                                ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 18,
                            )
                                : const Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              childCount: (HomeCubit.get(context).homeResponse?.data?.products?.length)!
          )
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()..moveTo(0, 0);

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);

    path.lineTo(size.width - 20, size.height - 20);
    path.quadraticBezierTo(
        size.width, size.height - 25, size.width, size.height - 50);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
