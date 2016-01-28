# NGSButtonAnimator

[![CI Status](http://img.shields.io/travis/Paulius Vindzigelskis/NGSButtonAnimator.svg?style=flat)](https://travis-ci.org/Paulius Vindzigelskis/NGSButtonAnimator)
[![Version](https://img.shields.io/cocoapods/v/NGSButtonAnimator.svg?style=flat)](http://cocoapods.org/pods/NGSButtonAnimator)
[![License](https://img.shields.io/cocoapods/l/NGSButtonAnimator.svg?style=flat)](http://cocoapods.org/pods/NGSButtonAnimator)
[![Platform](https://img.shields.io/cocoapods/p/NGSButtonAnimator.svg?style=flat)](http://cocoapods.org/pods/NGSButtonAnimator)

## Usage

### Using Xcode interface builder

Add UIButton and change it's subclass to NGSAnimatedButton

### Programatically

```objc
NGSAnimatedButton *button = [[NGSAnimatedButton alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
button.center = CGPointMake(self.view.frame.size.width/2.f, self.view.frame.size.height/2.f);
[button setTitle:@"Center button" forState:UIControlStateNormal];
[button setPrimaryColor:[UIColor blueColor]];
[button setSecondaryColor:[UIColor yellowColor]];
[self.view addSubview:button];

///...

[button.animator becomeCircleAnimated:YES completion:nil];

///...

[button.animator becomeNormalAnimated:YES completion:nil];
```

## Requirements

iOS 8.0 or later

## Installation

NGSButtonAnimator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NGSButtonAnimator"
```

## Author

Paulius Vindzigelskis

## License

NGSButtonAnimator is available under the MIT license. See the LICENSE file for more info.
