This is my solution for solving problems in implementing server driven ui project.
With aim of this package you can receive your ui schema from server and according to that build your
user interface.

<h2>The widget which you can use for building your ui:</h2>
<b>1-Switch</b></br>
<b>2-Text Field</b></br>
<b>3-Rang</b></br>
<b>4-Selection</b></br>
</br>

# Getting started

For using this package your json schema must be like the example below:

```
 [
        //rang schema
        {
            "type": "range",
            "key": "price",
            "title": "total price",
            "essential": true,
            "from": [
                {
                    "key": 0,
                    "value": 0
                },
                {
                    "key": 250000000,
                    "value": 250000000
                },
            ],
            "to": [
                {
                    "key": 750000000,
                    "value": 750000000
                },
                {
                    "key": 1000000000,
                    "value": 1000000000
                },
            ]
        },
        //select schema
        {
            "type": "select",
            "key": "rooms",
            "title": "bed room bumber",
            "essential": false,
            "items": [
                {
                    "key": "همه",
                    "value": "0"
                },
                {
                    "key": "+1",
                    "value": "1"
                },
                {
                    "key": "+2",
                    "value": "2"
                },
                {
                    "key": "+3",
                    "value": "3"
                },
            ]
        },
        // text field schema
         {
            "type": "input",
            "InputType":"text"|"number",
            "multyLine":false|true,
            "title": "building age"
        }
        //switch schema
        {
            "type": "swtich",
            "title": "sales",
            "essencial":false
        }
       //btn schema
        {
            "type": "btn",
            "title": "جستجو"
        }
    ]
```
For handling state management i use get x and i handle what ever you need under the hood.

And finally to build your ui all you need is a code like this:

```
class SearchWidget extends StatelessWidget {
  int schemaId;

  SearchWidget({super.key, required this.schemaId}) {
  // this is a function which get hte schema from server
    controller.getSearchSchema(1);
  }

  final controller = Get.find<SearchHomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  
               child: SingleChildScrollView(
                  // this part is responsible for building your server driven ui
                    child: FormPageFactory(
                      schema: controller.searchSchema.value,
                      values: controller.filters.value,
                    ),
                  ),                
    );
  }
}

```

NOTE
Unfortunately ui is not customizable, in the future i will work on this issue