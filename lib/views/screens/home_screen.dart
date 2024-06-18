import 'package:coffee/models/items_response_model.dart';
import 'package:coffee/utils/utils.dart';
import 'package:coffee/views/screens/details_screen.dart';
import 'package:coffee/views/widget/build_text_widget.dart';
import 'package:flutter/material.dart';

import '../../bloc/home_bloc.dart';

import '../../utils/constants.dart';
import '../widget/build_icon_widget.dart';
import '../widget/build_items_widget.dart';
import '../widget/build_textformfied_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ItemsResponseModel> coffeeList = [];
  List<ItemsResponseModel> _filteredCoffeeList = [];
  bool isLoading = true;
  TextEditingController _searchController = TextEditingController();

  HomeBloc homeBloc = HomeBloc();
  getData() async {
    homeBloc.getAllItems();
  }

  @override
  void initState() {
    super.initState();
    getData();
    homeBloc.itemsResponseModel.listen((event) {
      coffeeList.addAll(event);

      setState(() {
        _filteredCoffeeList = coffeeList;

        isLoading = false;
      });
    });

    _searchController.addListener(() {
      _filterCoffees();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCoffees() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCoffeeList = coffeeList.where((coffee) {
        return coffee.itemName.toString().toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            height: screenHeight(context),
            width: screenWidth(context),
            color: Colors.black,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          )
        : Container(
            height: screenHeight(context),
            width: screenWidth(context),
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 15),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 13),
                          child: BuildTextWidget(
                            text: "Menu",
                            fontWeight: FontWeight.w600,
                            size: 20,
                            color: Constants.kitGradients[0],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: SizedBox(
                            width: screenWidth(context, dividedBy: 1.4),
                            height: screenHeight(context, dividedBy: 16),
                            child: BuildTextFormFieldWidget(
                              hintText: "Search Anything",
                              prefixIcon: BuildIconWidget(
                                iconData: Icons.search,
                                color: Constants.kitGradients[0],
                                size: 30,
                              ),
                              controller: _searchController,
                              onChanged: (value) {
                                _filterCoffees();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: screenHeight(context, dividedBy: 1.25),
                      width: screenWidth(context),
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: _filteredCoffeeList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 1.0,
                          childAspectRatio: 0.7,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        itemBuilder: (context, index) {
                          return BuildItemsWidget(
                            networkImage:
                                _filteredCoffeeList[index].image.toString(),
                            name:
                                _filteredCoffeeList[index].itemName.toString(),
                            price: _filteredCoffeeList[index].price.toString(),
                            onTap: () {
                              push(
                                context,
                                DetailsScreen(
                                  id: _filteredCoffeeList[index].id.toString(),
                                  image: _filteredCoffeeList[index]
                                      .image
                                      .toString(),
                                  name: _filteredCoffeeList[index]
                                      .itemName
                                      .toString(),
                                  price: _filteredCoffeeList[index]
                                      .price
                                      .toString(),
                                  discription: _filteredCoffeeList[index]
                                      .discription
                                      .toString(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
