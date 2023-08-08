import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(left: 10,right: 10),
      child: Container(
        margin: EdgeInsets.zero,
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius:BorderRadius.circular(4),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top: 12.0),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                hintText: 'Restaurants or dish...',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
