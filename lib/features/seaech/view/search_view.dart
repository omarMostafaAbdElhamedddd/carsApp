
import 'package:cars_app/conts.dart';
import 'package:cars_app/features/cars_by_category_or_model/model/CarModel.dart';
import 'package:cars_app/features/seaech/view/widgets/searchItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../utitls/resposiveSize.dart';

import '../../splashView/view/widgets/customText.dart';
import '../presenter/search_presenter.dart';



class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController controller = TextEditingController();
  String valuee = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            CustomHorizentalSizeBox(
              padding: .5,
            ),
          ],
          titleSpacing: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  IconlyLight.arrow_left,
                  size: 35,
                ),
              )
              ),
          backgroundColor: kPreimaryColor,
          automaticallyImplyLeading: false,
          toolbarHeight: SizeConfig.screenHeight! * .09,
          title: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              child: TextFormField(
                onChanged: (value) {
                  valuee = value;
                  setState(() {});
                },
                controller: controller,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.text = '';
                        valuee = '';
                        setState(() {});
                      },
                      icon: valuee != ''
                          ? Icon(Icons.close, color: kPreimaryColor)
                          : SizedBox(),
                    ),
                    prefixIcon: Icon(
                      IconlyLight.search,
                      color: kPreimaryColor,
                    ),
                    hintText: 'Search',
                    hoverColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
          ),
        ),
        body: controller.text != ''
            ? FutureBuilder<List<Car>>(
                future: Search.getAllCars(controller.text),
                builder: (context, snabshot) {
                  if (snabshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: kPreimaryColor,
                      ),
                    );
                  } else if (snabshot.hasError) {
                    return Center(
                      child: SizedBox(),
                    );
                  } else if (snabshot.hasData && snabshot.data!.length == 0) {
                    return Container(
                      width: SizeConfig.screenWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image.asset('assets/images/search.jpg'),
                          CustomText(
                            text: 'No items match your search',
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snabshot.data!.length,
                        padding: EdgeInsets.only(top: 20, right: 10, left: 10),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomItemSearch(
                                  car: snabshot.data![index],
                                ),
                              ),
                              Divider(
                                color: kPreimaryColor.withOpacity(.4),
                              )
                            ],
                          );
                        });
                  }
                },
              )
            : SizedBox(
                child: Center(
                    child: Icon(
                  IconlyLight.search,
                  size: 50,
                )),
              ));
  }
}


