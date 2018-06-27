# Timeline

A flutter package that allows you to create basic timelines on your flutter application. This is customizable and easy to plugin to your application. You will find the following features:

* A simple timeline with a title and a description
* Customizable color options for - Line, Title, Description and Background
* Tween animation on the line
* Title will be truncated at 47 characters to prevent overflowing
* Description will be truncated at 75 character to prevent overflowing

<image src="Timeline.png" height="300em"/>

## Getting Started

You will need to the following dependency in your `pubspec.yaml` file

```dart
dependencies:
  flutter:
    sdk: flutter
  timeline: 0.0.4
```
### Usage

You will need to create a list of `TimelineModel` first. This creates an instance with an `id` which is a String at the moment, along with `title` and `description`

[Example](https://github.com/rejish4gt/flutter-timeline/blob/master/example/example.dart)

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Authors

* **Rejish Radhakrishnan**

## License

Copyright 2018 Rejish Radhakrishnan

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
