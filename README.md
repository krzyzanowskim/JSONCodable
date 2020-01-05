# JSONCodable

JSON Codable is what we need 90% of the time.

## Usage

```swift
struct Filter: JSONEncodable {
  id: String
}

let jsonString = Filter(id: "foo").toJSON()
```
