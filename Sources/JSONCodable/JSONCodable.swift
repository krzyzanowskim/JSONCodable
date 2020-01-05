//  Created by Marcin Krzyzanowski

import Foundation

public protocol JSONEncodable: Encodable { }

public extension JSONEncodable {
  func toJSON() throws -> String? {
    try String(data: JSONEncoder().encode(self), encoding: .utf8)
  }
}

public protocol JSONDecodable: Decodable { }

public extension JSONDecodable {
  func from(json data: Data) throws -> Self {
    try JSONDecoder().decode(Self.self, from: data)
  }
}

public protocol JSONCodable: JSONEncodable & JSONDecodable { }
