import XCTest
@testable import JSONCodable

private extension CodableFormat {

  private static var jsonSnakeCaseEncoder: JSONEncoder {
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    return encoder
  }

  private static var jsonSnakeCaseDecoder: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
  }

  // Custom format
  static let jsonSnakeCase = CodableFormat("jsonSnakeCase", jsonSnakeCaseEncoder, jsonSnakeCaseDecoder)
}

final class JSONCodableTests: XCTestCase {

  func testJSONCodable1() throws {
    struct F: JSONCodable, Identifiable, Equatable {
      let id: Int
    }

    let f1 = F(id: 1)
    let json = try f1.toJSON()
    XCTAssertEqual(json, "{\"id\":1}")

    let f2 = try F.from(json: json)
    XCTAssertEqual(f1, f2)
  }

  func testCodableFormat1() throws {

    struct F: Codable, Identifiable, Equatable {
      let id: Int
    }

    let f1 = F(id: 1)
    let data = try f1.to(.json)
    let json = String(decoding: data, as: UTF8.self)
    XCTAssertEqual(json, "{\"id\":1}")

    let f2 = try F.from(data, format: .json)
    XCTAssertEqual(f1, f2)
  }

  func testCodableFormatCustom() throws {

    struct F: Codable, Equatable {
      let myIdentifier: Int
    }

    let f1 = F(myIdentifier: 1)
    let data = try f1.to(.jsonSnakeCase)
    let json = String(decoding: data, as: UTF8.self)
    XCTAssertEqual(json, "{\"my_identifier\":1}")

    let f2 = try F.from(data, format: .jsonSnakeCase)
    XCTAssertEqual(f1, f2)
  }

  static var allTests = [
    ("testCodableFormat1", testCodableFormat1),
    ("testCodableFormat2", testCodableFormatCustom),
  ]
}
