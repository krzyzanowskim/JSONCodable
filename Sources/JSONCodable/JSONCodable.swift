//  Created by Marcin Krzyzanowski

import Foundation

public protocol JSONEncodable: Encodable { }

public extension JSONEncodable {
  func toJSON(using encoder: @autoclosure () -> JSONEncoder = JSONEncoder()) throws -> String {
    try String(decoding: encoder().encode(self), as: UTF8.self)
  }
}

public protocol JSONDecodable: Decodable { }

public extension JSONDecodable {
  static func from(json data: Data, using decoder: @autoclosure () -> JSONDecoder = JSONDecoder()) throws -> Self {
    try decoder().decode(Self.self, from: data)
  }

  static func from(json string: String, using decoder: @autoclosure () -> JSONDecoder = JSONDecoder()) throws -> Self {
    try self.from(json: Data(string.utf8), using: decoder())
  }
}

public protocol JSONCodable: JSONEncodable & JSONDecodable { }
