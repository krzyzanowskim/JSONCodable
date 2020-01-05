# JSONCodable

JSON Codable is what we need 90% of the time.

## Usage

```swift
struct Filter: JSONEncodable {
  id: String
}

let jsonString = Filter(id: "foo").toJSON()
```

## Installation

Copy `JSONCodable.swift` to your project, or

### Swift Package Manager

To depend on the package, you need to declare your dependency in your `Package.swift`:

```swift
.package(url: "https://github.com/krzyzanowskim/JSONCodable.git", from: "1.0.0"),
```

and to your application/library target, add "JSONCodable" to your dependencies, e.g. like this:

```swift
.target(name: "BestExampleApp", dependencies: ["JSONCodable"]),
```