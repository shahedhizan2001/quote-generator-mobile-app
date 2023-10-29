import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../commen/service/storage_sevice.dart';
import '../../../infrastructure/model/quotable.dart';
import '../../state/quote_bloc.dart';
import '../widget/elevated_button.dart';

class FavoriteSecreen extends StatefulWidget {
  FavoriteSecreen({super.key});

  @override
  State<FavoriteSecreen> createState() => _FavoriteSecreenState();
}

class _FavoriteSecreenState extends State<FavoriteSecreen> {
  late List<Quote> filteredQuotesList = [];

  @override
  void initState() {
    if (StorageService.getListId()!.length != 0)
      context.read<QuoteBloc>().add(GetQuote());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff8249B5), Color(0xff5D13E7)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
          child: BlocBuilder<QuoteBloc, QuoteState>(
            builder: (context, state) {
              final bloc = context.read<QuoteBloc>();
              return ListView(
                children: [
                  CustomerElevatedButton(
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context, 'Home', (route) => false),
                    widget: RPadding(
                      padding:
                          const EdgeInsets.only(left: 60, top: 14, bottom: 14),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Vector 9.svg",
                          ),
                          RSizedBox(
                            width: 13,
                          ),
                          Text(
                            "Back To Home Screen",
                            style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff323232),
                                fontFamily: 'GemunuLibre-Light'),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    color:  Color(0xffBFBFBB2),
                    fixedSize: Size(353.w, 60.h),
                  ),
                  Container(
                    width: 353,
                    height: 60,
                    margin: REdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      controller: bloc.searchController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {
                          filteredQuotesList = bloc.quote
                              .where((element) => element.quote
                                  .toString()
                                  .toLowerCase()
                                  .split(' ')
                                  .any((word) =>
                                      word.startsWith(value.toLowerCase())))
                              .toList();
                          print(filteredQuotesList.toString());
                        });
                      },
                      style: TextStyle(
                        color: Color(0xff323232),
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'GemunuLibre-Light'
                      ),
                      decoration: InputDecoration(

                        suffixIcon:
                        IconButton(
                          icon: Icon(
                            Icons.cancel_outlined,
                            size: 24.sp,
                            color: Color(0xff808194),
                          ),
                          onPressed: () {
                            setState(() {
                              bloc.searchController.clear();
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Color(0xffFBFBFB),
                        hintText: "Type Something Here To Search..",
                        contentPadding: REdgeInsets.all(18),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintStyle: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff323232B2),
                            fontFamily: 'GemunuLibre-Light'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<QuoteBloc, QuoteState>(
                    builder: (context, state) {
                      if (state is GetQuoteLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      } else if (state is GetQuoteState) {
                        return filterFavorite(filteredQuotesList.isNotEmpty
                            ? filteredQuotesList
                            : bloc.quote);
                      } else
                        return SizedBox.shrink();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  filterFavorite(List<Quote> favoQuote) {
    return RSizedBox(
        height: 900,
        width: 188.w,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                child: Container(
                  width: 353.w,
                  color: Color(0xffFBFBFB),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin:
                              REdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Text(
                            "“${favoQuote[index].quote}”",
                            style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff323232),
                                fontFamily: 'GemunuLibre-Light'),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        RPadding(
                          padding: const EdgeInsets.only(right: 20, bottom: 20),
                          child: Text(
                            '${favoQuote[index].author}',
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff323232B2),
                                fontFamily: 'GemunuLibre_ExtraLight'),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        CustomerElevatedButton(
                          color: Color(0xffFBFBFB),
                          fixedSize: Size(313.w, 48.h),
                          padding:
                              REdgeInsets.only(left: 20,bottom: 20, right: 20),
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/Vector 15.jpg",
                                width: 29.33.sp,
                                height: 26.67.sp,
                              ),
                              RSizedBox(
                                width: 5.33,
                              ),
                              Text(
                                "Remove From Favorite",
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff8249B5),
                                    fontFamily: 'GemunuLibre_ExtraLight'),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(6.r),
                                  bottomRight: Radius.circular(6.r)),
                              side: BorderSide(
                                  color: Color(0xff8249B5), width: 2.sp)),
                          onPressed: () {
                            setState(() {
                              StorageService.removeId(favoQuote[index].id!);
                              context
                                  .read<QuoteBloc>()
                                  .quoteId
                                  .remove(favoQuote[index].id!);
                              favoQuote.remove(favoQuote[index]);
                            });
                          },
                        ),
                      ]),
                ),
              );
            },
            separatorBuilder: (context, index) => RSizedBox(
                  height: 10,
                ),
            itemCount: favoQuote.length));
  }
}
