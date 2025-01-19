// DO NOT EDIT.
// swift-format-ignore-file
// swiftlint:disable all
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: core/core.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public enum Core_Type: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int
  case unknown // = 0
  case conn // = 1
  case connack // = 2
  case send // = 3
  case sendack // = 4
  case recv // = 5
  case recvack // = 6
  case ping // = 7
  case pong // = 8
  case disconn // = 9
  case sub // = 10
  case suback // = 11
  case unsub // = 12
  case unsuback // = 13
  case UNRECOGNIZED(Int)

  public init() {
    self = .unknown
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unknown
    case 1: self = .conn
    case 2: self = .connack
    case 3: self = .send
    case 4: self = .sendack
    case 5: self = .recv
    case 6: self = .recvack
    case 7: self = .ping
    case 8: self = .pong
    case 9: self = .disconn
    case 10: self = .sub
    case 11: self = .suback
    case 12: self = .unsub
    case 13: self = .unsuback
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .unknown: return 0
    case .conn: return 1
    case .connack: return 2
    case .send: return 3
    case .sendack: return 4
    case .recv: return 5
    case .recvack: return 6
    case .ping: return 7
    case .pong: return 8
    case .disconn: return 9
    case .sub: return 10
    case .suback: return 11
    case .unsub: return 12
    case .unsuback: return 13
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [Core_Type] = [
    .unknown,
    .conn,
    .connack,
    .send,
    .sendack,
    .recv,
    .recvack,
    .ping,
    .pong,
    .disconn,
    .sub,
    .suback,
    .unsub,
    .unsuback,
  ]

}

public struct Core_Conn: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var clientKey: String = String()

  public var deviceID: String = String()

  public var deviceFlag: Int32 = 0

  public var timestamp: Int64 = 0

  public var userID: String = String()

  public var token: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Core_Connack: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var serverKey: String = String()

  public var salt: String = String()

  public var timeDiff: Int64 = 0

  public var code: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Core_Disconn: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var code: Int32 = 0

  public var reason: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Core_Ping: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Core_Pong: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Core_Recv: @unchecked Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var msgKey: String = String()

  public var expire: Int64 = 0

  public var messageID: Int64 = 0

  public var messageSeq: Int64 = 0

  public var cmessageID: String = String()

  public var cmessageSeq: Int64 = 0

  public var timestamp: Int64 = 0

  public var channelID: String = String()

  public var channelType: Int32 = 0

  public var topic: String = String()

  public var userID: String = String()

  public var payload: Data = Data()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Core_Recvack: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var messageID: Int64 = 0

  public var messageSeq: Int64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Core_Send: @unchecked Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var msgKey: String = String()

  public var expire: Int64 = 0

  public var cmessageID: String = String()

  public var cmessageSeq: Int64 = 0

  public var channelID: String = String()

  public var channelType: Int32 = 0

  public var topic: String = String()

  public var payload: Data = Data()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Core_Sendack: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var messageID: Int64 = 0

  public var messageSeq: Int64 = 0

  public var cmessageID: String = String()

  public var cmessageSeq: Int64 = 0

  public var code: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Core_Sub: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var userID: String = String()

  public var channelID: String = String()

  public var channelType: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Core_Suback: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var userID: String = String()

  public var channelID: String = String()

  public var channelType: Int32 = 0

  public var code: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Core_Unsub: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var userID: String = String()

  public var channelID: String = String()

  public var channelType: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Core_Unsuback: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var userID: String = String()

  public var channelID: String = String()

  public var channelType: Int32 = 0

  public var code: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "core"

extension Core_Type: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UNKNOWN"),
    1: .same(proto: "CONN"),
    2: .same(proto: "CONNACK"),
    3: .same(proto: "SEND"),
    4: .same(proto: "SENDACK"),
    5: .same(proto: "RECV"),
    6: .same(proto: "RECVACK"),
    7: .same(proto: "PING"),
    8: .same(proto: "PONG"),
    9: .same(proto: "DISCONN"),
    10: .same(proto: "SUB"),
    11: .same(proto: "SUBACK"),
    12: .same(proto: "UNSUB"),
    13: .same(proto: "UNSUBACK"),
  ]
}

extension Core_Conn: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Conn"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "clientKey"),
    2: .same(proto: "deviceId"),
    3: .same(proto: "deviceFlag"),
    4: .same(proto: "timestamp"),
    5: .same(proto: "userId"),
    6: .same(proto: "token"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.clientKey) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.deviceID) }()
      case 3: try { try decoder.decodeSingularInt32Field(value: &self.deviceFlag) }()
      case 4: try { try decoder.decodeSingularInt64Field(value: &self.timestamp) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.userID) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.token) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.clientKey.isEmpty {
      try visitor.visitSingularStringField(value: self.clientKey, fieldNumber: 1)
    }
    if !self.deviceID.isEmpty {
      try visitor.visitSingularStringField(value: self.deviceID, fieldNumber: 2)
    }
    if self.deviceFlag != 0 {
      try visitor.visitSingularInt32Field(value: self.deviceFlag, fieldNumber: 3)
    }
    if self.timestamp != 0 {
      try visitor.visitSingularInt64Field(value: self.timestamp, fieldNumber: 4)
    }
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 5)
    }
    if !self.token.isEmpty {
      try visitor.visitSingularStringField(value: self.token, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_Conn, rhs: Core_Conn) -> Bool {
    if lhs.clientKey != rhs.clientKey {return false}
    if lhs.deviceID != rhs.deviceID {return false}
    if lhs.deviceFlag != rhs.deviceFlag {return false}
    if lhs.timestamp != rhs.timestamp {return false}
    if lhs.userID != rhs.userID {return false}
    if lhs.token != rhs.token {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_Connack: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Connack"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "serverKey"),
    2: .same(proto: "salt"),
    3: .same(proto: "timeDiff"),
    4: .same(proto: "code"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.serverKey) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.salt) }()
      case 3: try { try decoder.decodeSingularInt64Field(value: &self.timeDiff) }()
      case 4: try { try decoder.decodeSingularInt32Field(value: &self.code) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.serverKey.isEmpty {
      try visitor.visitSingularStringField(value: self.serverKey, fieldNumber: 1)
    }
    if !self.salt.isEmpty {
      try visitor.visitSingularStringField(value: self.salt, fieldNumber: 2)
    }
    if self.timeDiff != 0 {
      try visitor.visitSingularInt64Field(value: self.timeDiff, fieldNumber: 3)
    }
    if self.code != 0 {
      try visitor.visitSingularInt32Field(value: self.code, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_Connack, rhs: Core_Connack) -> Bool {
    if lhs.serverKey != rhs.serverKey {return false}
    if lhs.salt != rhs.salt {return false}
    if lhs.timeDiff != rhs.timeDiff {return false}
    if lhs.code != rhs.code {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_Disconn: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Disconn"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "code"),
    2: .same(proto: "reason"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt32Field(value: &self.code) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.reason) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.code != 0 {
      try visitor.visitSingularInt32Field(value: self.code, fieldNumber: 1)
    }
    if !self.reason.isEmpty {
      try visitor.visitSingularStringField(value: self.reason, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_Disconn, rhs: Core_Disconn) -> Bool {
    if lhs.code != rhs.code {return false}
    if lhs.reason != rhs.reason {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_Ping: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Ping"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    // Load everything into unknown fields
    while try decoder.nextFieldNumber() != nil {}
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_Ping, rhs: Core_Ping) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_Pong: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Pong"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    // Load everything into unknown fields
    while try decoder.nextFieldNumber() != nil {}
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_Pong, rhs: Core_Pong) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_Recv: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Recv"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "msgKey"),
    2: .same(proto: "expire"),
    3: .same(proto: "messageId"),
    4: .same(proto: "messageSeq"),
    5: .same(proto: "cmessageId"),
    6: .same(proto: "cmessageSeq"),
    7: .same(proto: "timestamp"),
    8: .same(proto: "channelId"),
    9: .same(proto: "channelType"),
    10: .same(proto: "topic"),
    11: .same(proto: "userId"),
    12: .same(proto: "payload"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.msgKey) }()
      case 2: try { try decoder.decodeSingularInt64Field(value: &self.expire) }()
      case 3: try { try decoder.decodeSingularInt64Field(value: &self.messageID) }()
      case 4: try { try decoder.decodeSingularInt64Field(value: &self.messageSeq) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.cmessageID) }()
      case 6: try { try decoder.decodeSingularInt64Field(value: &self.cmessageSeq) }()
      case 7: try { try decoder.decodeSingularInt64Field(value: &self.timestamp) }()
      case 8: try { try decoder.decodeSingularStringField(value: &self.channelID) }()
      case 9: try { try decoder.decodeSingularInt32Field(value: &self.channelType) }()
      case 10: try { try decoder.decodeSingularStringField(value: &self.topic) }()
      case 11: try { try decoder.decodeSingularStringField(value: &self.userID) }()
      case 12: try { try decoder.decodeSingularBytesField(value: &self.payload) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.msgKey.isEmpty {
      try visitor.visitSingularStringField(value: self.msgKey, fieldNumber: 1)
    }
    if self.expire != 0 {
      try visitor.visitSingularInt64Field(value: self.expire, fieldNumber: 2)
    }
    if self.messageID != 0 {
      try visitor.visitSingularInt64Field(value: self.messageID, fieldNumber: 3)
    }
    if self.messageSeq != 0 {
      try visitor.visitSingularInt64Field(value: self.messageSeq, fieldNumber: 4)
    }
    if !self.cmessageID.isEmpty {
      try visitor.visitSingularStringField(value: self.cmessageID, fieldNumber: 5)
    }
    if self.cmessageSeq != 0 {
      try visitor.visitSingularInt64Field(value: self.cmessageSeq, fieldNumber: 6)
    }
    if self.timestamp != 0 {
      try visitor.visitSingularInt64Field(value: self.timestamp, fieldNumber: 7)
    }
    if !self.channelID.isEmpty {
      try visitor.visitSingularStringField(value: self.channelID, fieldNumber: 8)
    }
    if self.channelType != 0 {
      try visitor.visitSingularInt32Field(value: self.channelType, fieldNumber: 9)
    }
    if !self.topic.isEmpty {
      try visitor.visitSingularStringField(value: self.topic, fieldNumber: 10)
    }
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 11)
    }
    if !self.payload.isEmpty {
      try visitor.visitSingularBytesField(value: self.payload, fieldNumber: 12)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_Recv, rhs: Core_Recv) -> Bool {
    if lhs.msgKey != rhs.msgKey {return false}
    if lhs.expire != rhs.expire {return false}
    if lhs.messageID != rhs.messageID {return false}
    if lhs.messageSeq != rhs.messageSeq {return false}
    if lhs.cmessageID != rhs.cmessageID {return false}
    if lhs.cmessageSeq != rhs.cmessageSeq {return false}
    if lhs.timestamp != rhs.timestamp {return false}
    if lhs.channelID != rhs.channelID {return false}
    if lhs.channelType != rhs.channelType {return false}
    if lhs.topic != rhs.topic {return false}
    if lhs.userID != rhs.userID {return false}
    if lhs.payload != rhs.payload {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_Recvack: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Recvack"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "messageId"),
    2: .same(proto: "messageSeq"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt64Field(value: &self.messageID) }()
      case 2: try { try decoder.decodeSingularInt64Field(value: &self.messageSeq) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.messageID != 0 {
      try visitor.visitSingularInt64Field(value: self.messageID, fieldNumber: 1)
    }
    if self.messageSeq != 0 {
      try visitor.visitSingularInt64Field(value: self.messageSeq, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_Recvack, rhs: Core_Recvack) -> Bool {
    if lhs.messageID != rhs.messageID {return false}
    if lhs.messageSeq != rhs.messageSeq {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_Send: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Send"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "msgKey"),
    2: .same(proto: "expire"),
    3: .same(proto: "cmessageId"),
    4: .same(proto: "cmessageSeq"),
    5: .same(proto: "channelId"),
    6: .same(proto: "channelType"),
    7: .same(proto: "topic"),
    8: .same(proto: "payload"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.msgKey) }()
      case 2: try { try decoder.decodeSingularInt64Field(value: &self.expire) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.cmessageID) }()
      case 4: try { try decoder.decodeSingularInt64Field(value: &self.cmessageSeq) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.channelID) }()
      case 6: try { try decoder.decodeSingularInt32Field(value: &self.channelType) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.topic) }()
      case 8: try { try decoder.decodeSingularBytesField(value: &self.payload) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.msgKey.isEmpty {
      try visitor.visitSingularStringField(value: self.msgKey, fieldNumber: 1)
    }
    if self.expire != 0 {
      try visitor.visitSingularInt64Field(value: self.expire, fieldNumber: 2)
    }
    if !self.cmessageID.isEmpty {
      try visitor.visitSingularStringField(value: self.cmessageID, fieldNumber: 3)
    }
    if self.cmessageSeq != 0 {
      try visitor.visitSingularInt64Field(value: self.cmessageSeq, fieldNumber: 4)
    }
    if !self.channelID.isEmpty {
      try visitor.visitSingularStringField(value: self.channelID, fieldNumber: 5)
    }
    if self.channelType != 0 {
      try visitor.visitSingularInt32Field(value: self.channelType, fieldNumber: 6)
    }
    if !self.topic.isEmpty {
      try visitor.visitSingularStringField(value: self.topic, fieldNumber: 7)
    }
    if !self.payload.isEmpty {
      try visitor.visitSingularBytesField(value: self.payload, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_Send, rhs: Core_Send) -> Bool {
    if lhs.msgKey != rhs.msgKey {return false}
    if lhs.expire != rhs.expire {return false}
    if lhs.cmessageID != rhs.cmessageID {return false}
    if lhs.cmessageSeq != rhs.cmessageSeq {return false}
    if lhs.channelID != rhs.channelID {return false}
    if lhs.channelType != rhs.channelType {return false}
    if lhs.topic != rhs.topic {return false}
    if lhs.payload != rhs.payload {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_Sendack: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Sendack"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "messageId"),
    2: .same(proto: "messageSeq"),
    3: .same(proto: "cmessageId"),
    4: .same(proto: "cmessageSeq"),
    5: .same(proto: "code"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt64Field(value: &self.messageID) }()
      case 2: try { try decoder.decodeSingularInt64Field(value: &self.messageSeq) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.cmessageID) }()
      case 4: try { try decoder.decodeSingularInt64Field(value: &self.cmessageSeq) }()
      case 5: try { try decoder.decodeSingularInt32Field(value: &self.code) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.messageID != 0 {
      try visitor.visitSingularInt64Field(value: self.messageID, fieldNumber: 1)
    }
    if self.messageSeq != 0 {
      try visitor.visitSingularInt64Field(value: self.messageSeq, fieldNumber: 2)
    }
    if !self.cmessageID.isEmpty {
      try visitor.visitSingularStringField(value: self.cmessageID, fieldNumber: 3)
    }
    if self.cmessageSeq != 0 {
      try visitor.visitSingularInt64Field(value: self.cmessageSeq, fieldNumber: 4)
    }
    if self.code != 0 {
      try visitor.visitSingularInt32Field(value: self.code, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_Sendack, rhs: Core_Sendack) -> Bool {
    if lhs.messageID != rhs.messageID {return false}
    if lhs.messageSeq != rhs.messageSeq {return false}
    if lhs.cmessageID != rhs.cmessageID {return false}
    if lhs.cmessageSeq != rhs.cmessageSeq {return false}
    if lhs.code != rhs.code {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_Sub: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Sub"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "userId"),
    2: .same(proto: "channelId"),
    3: .same(proto: "channelType"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.userID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.channelID) }()
      case 3: try { try decoder.decodeSingularInt32Field(value: &self.channelType) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 1)
    }
    if !self.channelID.isEmpty {
      try visitor.visitSingularStringField(value: self.channelID, fieldNumber: 2)
    }
    if self.channelType != 0 {
      try visitor.visitSingularInt32Field(value: self.channelType, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_Sub, rhs: Core_Sub) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.channelID != rhs.channelID {return false}
    if lhs.channelType != rhs.channelType {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_Suback: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Suback"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "userId"),
    2: .same(proto: "channelId"),
    3: .same(proto: "channelType"),
    4: .same(proto: "code"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.userID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.channelID) }()
      case 3: try { try decoder.decodeSingularInt32Field(value: &self.channelType) }()
      case 4: try { try decoder.decodeSingularInt32Field(value: &self.code) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 1)
    }
    if !self.channelID.isEmpty {
      try visitor.visitSingularStringField(value: self.channelID, fieldNumber: 2)
    }
    if self.channelType != 0 {
      try visitor.visitSingularInt32Field(value: self.channelType, fieldNumber: 3)
    }
    if self.code != 0 {
      try visitor.visitSingularInt32Field(value: self.code, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_Suback, rhs: Core_Suback) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.channelID != rhs.channelID {return false}
    if lhs.channelType != rhs.channelType {return false}
    if lhs.code != rhs.code {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_Unsub: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Unsub"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "userId"),
    2: .same(proto: "channelId"),
    3: .same(proto: "channelType"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.userID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.channelID) }()
      case 3: try { try decoder.decodeSingularInt32Field(value: &self.channelType) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 1)
    }
    if !self.channelID.isEmpty {
      try visitor.visitSingularStringField(value: self.channelID, fieldNumber: 2)
    }
    if self.channelType != 0 {
      try visitor.visitSingularInt32Field(value: self.channelType, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_Unsub, rhs: Core_Unsub) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.channelID != rhs.channelID {return false}
    if lhs.channelType != rhs.channelType {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_Unsuback: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Unsuback"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "userId"),
    2: .same(proto: "channelId"),
    3: .same(proto: "channelType"),
    4: .same(proto: "code"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.userID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.channelID) }()
      case 3: try { try decoder.decodeSingularInt32Field(value: &self.channelType) }()
      case 4: try { try decoder.decodeSingularInt32Field(value: &self.code) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 1)
    }
    if !self.channelID.isEmpty {
      try visitor.visitSingularStringField(value: self.channelID, fieldNumber: 2)
    }
    if self.channelType != 0 {
      try visitor.visitSingularInt32Field(value: self.channelType, fieldNumber: 3)
    }
    if self.code != 0 {
      try visitor.visitSingularInt32Field(value: self.code, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_Unsuback, rhs: Core_Unsuback) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.channelID != rhs.channelID {return false}
    if lhs.channelType != rhs.channelType {return false}
    if lhs.code != rhs.code {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
