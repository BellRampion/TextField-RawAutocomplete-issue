// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, no_logic_in_create_state, prefer_final_fields

import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  double fontSize = 16;
  ErrorPage({Key? key,})
      : super(key: key);
      
        @override
        State<StatefulWidget> createState() => ErrorPageState(initialStr: "");

}

class ErrorPageState extends State<ErrorPage>{
  String initialStr; 
  Icon all17Icon = Icon(Icons.clear, color: Colors.red);
  List<String> _options = <String>[
    '',
    'AAAAAAAAAAAAAAAAA'
  ];
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  ErrorPageState({required this.initialStr}) : super();

  @override
  void initState(){
    super.initState();
    //textEditingController.text = initialStr;

    if (initialStr.length == 17){
      all17Icon = Icon(Icons.check, color: Colors.green);
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: 
            Focus(
              child: RawAutocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue){
                  return _options.where((String option){
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
                textEditingController: textEditingController,
                focusNode: focusNode,
                fieldViewBuilder: (
                  BuildContext context, 
                  TextEditingController controller, 
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted
                ){
                  return TextFormField(
                    focusNode: focusNode,
                    controller: controller,
                    maxLength: 17,
                    decoration: InputDecoration(
                      suffixIcon: all17Icon,
                    ),
                    onChanged: (String value){ 
                      onFieldSubmitted();

                      if (value.length == 17){
                        setState(() {
                          all17Icon = Icon(Icons.check, color: Colors.green);
                        });
                      }
                      else {
                        setState(() {
                          all17Icon = Icon(Icons.clear, color: Colors.red);
                        });
                      }
                    }
                  );
                },
                optionsViewBuilder: (
                  BuildContext context,
                  AutocompleteOnSelected<String> onSelected,
                  Iterable<String> options
                ){
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4, 
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 6,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8.0),
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index){
                            final String option = options.elementAt(index);
                            return GestureDetector(
                              onTap: (){
                                onSelected(option);
                                if (option.length == 17){
                                  setState(() {
                                    all17Icon = Icon(Icons.check, color: Colors.green);
                                  });
                                }
                                else {
                                  setState(() {
                                    all17Icon = Icon(Icons.clear, color: Colors.red);
                                  });
                                }
                              },
                              child: ListTile(
                                title: Text(option),
                              ),
                            );
                          }
                        ),
                      ),
                    ), 
                  );
                },
              ),
            ),
            )
          ],
        )
      ),
    );
  }
}