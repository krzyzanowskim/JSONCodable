# JSONCodable

JSON Codable is what we need 90% of the time.

## Usage

```swift
struct Filter: JSONCodable {
  let id: String
}

let jsonString = try Filter(id: "foo").toJSON()
```

or use `CodableFormat`:

```swift
struct Filter: Codable {
  let id: String
}

let data = try Filter(id: "foo").to(.json)
let filter = try Filter.from(data, format: .json)
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
