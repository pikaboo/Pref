# Pref

[![CI Status](https://img.shields.io/travis/pikaboo/Pref.svg?style=flat)](https://travis-ci.org/pikaboo/Pref)
[![Version](https://img.shields.io/cocoapods/v/Pref.svg?style=flat)](https://cocoapods.org/pods/Pref)
[![License](https://img.shields.io/cocoapods/l/Pref.svg?style=flat)](https://cocoapods.org/pods/Pref)
[![Platform](https://img.shields.io/cocoapods/p/Pref.svg?style=flat)](https://cocoapods.org/pods/Pref)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Pref is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Pref'
```
Pref allows you to store custom objects with ease!

- Store objects that implement the codable protocol
- Store arrays that implement the codable protocol

# How to use

Create an object that implements the codable protocol:
```swift
class DummyCodableObject: NSObject, Codable {

    var name:String!
    var lastName:String!

    enum CodingKeys: String, CodingKey {
        case name
        case lastName = "last_name"
    }
}
```

Create a Pref variable that accepts your object:
```swift
self.myStoredPref = Pref<DummyCodableObject>(prefs:UserDefaults.standard,key:"StamObject")
```
If you need a defaultValue:
```swift
self.myStoredPref = Pref<DummyCodableObject>(prefs:UserDefaults.standard,key:"StamObject", defaultValue:DummyCodableObject())
```
Use it at will:
```swift
let myStoredValue: DummyCodableObject = self.myStoredPref.get()
```

Or store a new value:

```swift
let newDummyCodableObject = DummyCodableObject()
newDummyCodableObject.name = "Lena"
newDummyCodableObject.lastName = "Bru"
self.myStoredPref.set(newDummyCodableObject)
```
Get notified when the object changes:
```swift
NotificationCenter.default.addObserver(forName: self.myStoredPref.willSetNotificationName, object: nil, queue: OperationQueue.main) { (note) in
    let oldValue = note.userInfo?["previousValue"]
    let newValue = note.userInfo?["newValue"]
    //...
}
NotificationCenter.default.addObserver(forName: self.myStoredPref.didSetNotificationName, object: nil, queue: OperationQueue.main) { (note) in
    let newValue = note.userInfo?["newValue"]
    //...
}
```

You can even store collections:

```swift
let myCollectionStoredPref = Pref<[DummyCodableObject]>(prefs:UserDefaults.standard,key:"StamObjectArray")
let newDummyCodableObject = DummyCodableObject()
newDummyCodableObject.name = "Lena"
newDummyCodableObject.lastName = "Bru"
myCollectionStoredPref.set([newDummyCodableObject])
```


## Author

pikaboo

## License

Pref is available under the MIT license. See the LICENSE file for more info.
