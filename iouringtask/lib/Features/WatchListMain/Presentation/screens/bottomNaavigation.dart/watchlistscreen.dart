import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:iouringtask/Features/WatchListMain/Data/model/watchlistmodel.dart';

import 'package:iouringtask/Features/WatchListMain/Presentation/bloc/bloc_cubit.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/bloc/bloc_screen.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/bloc/bloc_state.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/commonwidgets/textfiled.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/screens/Dashboard/stockdetails.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/screens/bottomNaavigation.dart/searchpage.dart';

import 'package:iouringtask/core/Themes/stylecolors.dart';

class WatchlistScreen extends StatefulWidget {
  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();

    // TODO: implement initState
    controller = TabController(length: 3, vsync: this);
    context.read<WatchListBloc>().add(LoadWatchlist());


     Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<WatchListBloc, WatchListState>(
      builder: (context, state) {
        
        print(state);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Watchlist',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            actions: [
              Transform.rotate(
                  angle: -12, child: const Icon(Icons.push_pin_outlined)),
              const SizedBox(
                width: 5,
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size(
                  double.maxFinite, MediaQuery.of(context).size.height * 0.05),
              child: Row(
                children: [
                  Expanded(
                    flex: 80,
                    child: TabBar(
                      controller: controller,
                      tabs: const [
                        Tab(text: 'NIFTY'),
                        Tab(text: 'BANKNIFTY'),
                        Tab(text: 'SENSEX'),
                      ],
                    ),
                  ),
                  const Expanded(
                      flex: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            size: 25,
                            Icons.list_sharp,
                            color: ColorPallete.dark_secondaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: controller,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextformfield(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()),
                          );
                        },
                        hintText: 'Search & Add',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              size: 18,
                              Icons.apps_rounded,
                              color: ColorPallete.dark_secondaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              size: 18,
                              Icons.settings_input_component_outlined,
                              color: ColorPallete.dark_secondaryColor,
                            ),
                            SizedBox(
                              width: 15,
                            )
                          ],
                        )),
                  ),
               Expanded(
  child: BlocBuilder<WatchListBloc, WatchListState>(
    builder: (context, state) {
      if (state is WatchListLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is WatchListSuccessState) {
        List<WatchListModel> watchList = state.watchListDetails;

        return ReorderableListView(
          onReorder: (oldIndex, newIndex) {
            if (newIndex > oldIndex) newIndex -= 1;
            final reorderedList = List.of(watchList);
            final item = reorderedList.removeAt(oldIndex);
            reorderedList.insert(newIndex, item);

            context.read<WatchListBloc>().add(UpdateWatchListEvent(reorderedList));
          },
          children: [
            for (int index = 0; index < watchList.length; index++) 
              Column(
                key: ValueKey(watchList[index]), 
                children: [
                  ListTile(
                    
                    onTap: () {
                  
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StockDetailScreen(stock: watchList[index]),
                        ),
                      );
                    },
                    title: Text(watchList[index].stockName),
                    subtitle: Row(
                      children: [
                        Text(watchList[index].exchange),
                        const Spacer(),
                        Visibility(
                          visible: watchList[index].navValue != 0,
                          child: const Icon(Icons.badge, size: 15),
                        ),
                        Visibility(
                          visible: watchList[index].navValue != 0,
                          child: Text(watchList[index].navValue.toString()),
                        ),
                        const Spacer(flex: 9),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_drop_up_sharp,
                                color: ColorPallete.dark_secondaryColor,
                              ),
                              Text(
                                watchList[index].price.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: ColorPallete.dark_secondaryColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "+${watchList[index].change} (${watchList[index].percentageChange}%)",
                          style: const TextStyle(
                            color: ColorPallete.light_textcolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(), // Add divider after each item
                ],
              ),
          ],
        );
      } else if (state is WatchListFailureState) {
        return Center(child: Text(state.message));
      } else {
        return const Center(child: Text("Unknown state of code"));
      }
    },
  ),
),


                  const SizedBox()
                ],
              ),
               Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextformfield(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(),
            ),
          );
        },
        hintText: 'Search & Add',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              size: 18,
              Icons.apps_rounded,
              color: ColorPallete.dark_secondaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              size: 18,
              Icons.settings_input_component_outlined,
              color: ColorPallete.dark_secondaryColor,
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    ),
    Expanded(
      child: Center(
      child: _isLoading
          ? CircularProgressIndicator() // Show loading indicator
          : Text(
              "No Data",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ), // Show "No Data" message
    )
    ),
  ],
),
             Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextformfield(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(),
            ),
          );
        },
        hintText: 'Search & Add',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              size: 18,
              Icons.apps_rounded,
              color: ColorPallete.dark_secondaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              size: 18,
              Icons.settings_input_component_outlined,
              color: ColorPallete.dark_secondaryColor,
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    ),
    Expanded(
      child: Center(
        child: Text(
          "No Data",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    ),
  ],
)

            ],
          ),
        );
      },
    );
  }
}
