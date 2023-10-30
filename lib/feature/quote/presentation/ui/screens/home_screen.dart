import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../commen/service/storage_sevice.dart';
import '../../state/quote_bloc.dart';
import '../widget/elevated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorite.dart';

class HomeSecreen extends StatefulWidget {
  const HomeSecreen({super.key});

  @override
  State<HomeSecreen> createState() => _HomeSecreenState();
}

class _HomeSecreenState extends State<HomeSecreen> {
  @override
  void initState() {
    super.initState();
    context.read<QuoteBloc>().add(GenerateQuote());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff8249B5), Color(0xff5D13E7)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
          child: ListView(
            children: [
              RSizedBox(
                height: 267,
              ),
              Stack(
                children: [
                  Positioned(
                      child: CustomerElevatedButton(
                    color: Color(0xffBFBFBB2),
                    fixedSize: Size(353.w, 60.h),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(6.r))),
                    padding: EdgeInsets.only(
                         right: 20, left: 20, bottom: 10,top: 16),
                    widget: Text(
                      "Click Here To View Favorite Quotes",
                      style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff323232),
                          fontFamily: 'GemunuLibre-Light'),
                      textAlign: TextAlign.justify,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavoriteSecreen(),
                          ));
                    },
                  )),
                  Positioned(
                      right: 10,
                      left: 351,
                      child: RSizedBox(
                        height: 32,
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Color(0xff323232),
                          child: RPadding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('${StorageService.getListId()!.length}',
                                style: TextStyle(
                                    color: Color(0xffFBFBFB),
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'GemunuLibre-Light')),
                          ),
                        ),
                      ))
                ],
              ),
              BlocBuilder<QuoteBloc, QuoteState>(
                builder: (context, state) {
                  final bloc = context.read<QuoteBloc>();
                  if (state is GenerateQuoteLoading) {
                    return RPadding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else if (state is GenerateQuoteSuccess) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.only(
                            bottomLeft: Radius.circular(6.r),
                            bottomRight: Radius.circular(6.r)),
                        color: Color(0xffFBFBFB),
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: 353.w,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                        RPadding(
                             padding: REdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Text(
                            "“${state.quote.quote!}”",
                            style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff323232),
                                fontFamily: 'GemunuLibre-Light'),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        RPadding(
                          padding:
                              const EdgeInsets.only( bottom: 20,right: 20),
                          child: Text(
                            state.quote.author!,
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff323232B2),
                                fontFamily: 'GemunuLibre_ExtraLight'),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Row(
                          children: [
                            CustomerElevatedButton(
                              color: Color(0xff8249B5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6.r))),
                              fixedSize: Size(203.w, 48.h),
                              padding: REdgeInsets.only(
                                  left: 20, top: 0, bottom: 20),
                              widget: Text(
                                "Generate Another Quote",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffFBFBFB),
                                    fontFamily: 'GemunuLibre-Light'),
                                textAlign: TextAlign.justify,
                              ),
                              onPressed: () => bloc.add(GenerateQuote()),
                            ),
                            CustomerElevatedButton(
                              color: Color(0xffFBFBFB),
                              fixedSize: Size(100.w, 48.h),
                              padding: REdgeInsets.only(left: 10, bottom: 20),
                              widget: bloc.quoteId.contains(state.quote.id)
                                  ? Image.asset(
                                      "assets/images/Favorite_fill.jpg",
                                      width: 32.sp,
                                      height: 32.sp,
                                    )
                                  : Image.asset(
                                      "assets/images/Vector 15.jpg",
                                      width: 32.sp,
                                      height: 32.sp,
                                    ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(6.r)),
                                  side: BorderSide(
                                      color: Color(0xff8249B5), width: 2.sp)),
                              onPressed: () {
                                setState(() {
                                  if (bloc.quote.contains(state.quote!)) {
                                    StorageService.removeId(state.quote.id!);
                                    bloc.quote.remove(state.quote);
                                    bloc.quoteId.remove(state.quote.id!);
                                  } else if (!bloc.quote
                                      .contains(state.quote!)) {
                                    bloc.quoteId.add(state.quote.id!);
                                    StorageService.setListId(bloc.quoteId);
                                    print(bloc.quoteId.toString());
                                    bloc.quote.add(state.quote!);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ]),
                    );
                  } else
                    return SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
