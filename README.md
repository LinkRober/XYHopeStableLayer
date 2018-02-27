# XYHopeStableLayer

[![CI Status](http://img.shields.io/travis/LinkRober/XYHopeStableLayer.svg?style=flat)](https://travis-ci.org/LinkRober/XYHopeStableLayer)
[![Version](https://img.shields.io/cocoapods/v/XYHopeStableLayer.svg?style=flat)](http://cocoapods.org/pods/XYHopeStableLayer)
[![License](https://img.shields.io/cocoapods/l/XYHopeStableLayer.svg?style=flat)](http://cocoapods.org/pods/XYHopeStableLayer)
[![Platform](https://img.shields.io/cocoapods/p/XYHopeStableLayer.svg?style=flat)](http://cocoapods.org/pods/XYHopeStableLayer)

## Description

产品安全组件，减少线上App因为一些常见的问题发送崩溃

- 方法未找到 -- 完成
- 数组问题 
- 字典问题
- KVO
- 字符串

## Theory
方法未找到：在完整的消息转发第一步的时候，hook到`-(id)forwardingTargetForSelector:(SEL)selector`方法，检查当前类是否实现了该方法，如果没有动态添加一个类，将selector绑定到一个新的`IMP`


## Installation

XYHopeStableLayer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XYHopeStableLayer'
```

## Author

LinkRober, min.xia@quvideo.com

## License

XYHopeStableLayer is available under the MIT license. See the LICENSE file for more info.
