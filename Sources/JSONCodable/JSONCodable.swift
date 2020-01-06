//  Created by Marcin Krzyzanowski

import Foundation

public protocol JSONEncodable: Encodable { }

public extension JSONEncodable {
  func toJSON(jsonEncoder: JSONEncoder = JSONEncoder()) throws -> String? {
    try String(data: jsonEncoder.encode(self), encoding: .utf8)
  }
}

public protocol JSONDecodable: Decodable { }

public extension JSONDecodable {
  static func from(json data: Data, jsonDecoder: JSONDecoder = JSONDecoder()) throws -> Self {
    try jsonDecoder.decode(Self.self, from: data)
  }
}

public protocol JSONCodable: JSONEncodable & JSONDecodable { }
