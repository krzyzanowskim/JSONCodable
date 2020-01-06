//  Created by Marcin Krzyzanowski

import Foundation

public protocol JSONEncodable: Encodable { }

public extension JSONEncodable {
  func toJSON(jsonEncoder: JSONEncoder = JSONEncoder()) throws -> String {
    try String(decoding: jsonEncoder.encode(self), as: UTF8.self)
  }
}

public protocol JSONDecodable: Decodable { }

public extension JSONDecodable {
  static func from(json data: Data, jsonDecoder: JSONDecoder = JSONDecoder()) throws -> Self {
    try jsonDecoder.decode(Self.self, from: data)
  }
}

public protocol JSONCodable: JSONEncodable & JSONDecodable { }
