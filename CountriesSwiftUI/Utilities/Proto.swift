import Foundation
import SwiftProtobuf



// const (
// 	typeSize = 1
// 	bodySize = 4
// )

// func messageType(msg proto.Message) byte {
// 	switch msg.(type) {
// 	case *core.Conn:
// 		return 1
// 	case *core.Connack:
// 		return 2
// 	case *core.Send:
// 		return 3
// 	case *core.Sendack:
// 		return 4
// 	case *core.Recv:
// 		return 5
// 	case *core.Recvack:
// 		return 6
// 	case *core.Ping:
// 		return 7
// 	case *core.Pong:
// 		return 8
// 	case *core.Disconn:
// 		return 9
// 	case *core.Sub:
// 		return 10
// 	case *core.Suback:
// 		return 11
// 	case *core.Unsub:
// 		return 12
// 	case *core.Unsuback:
// 		return 13
// 	default:
// 		return 0
// 	}
// }

// func typeOfMessage(msgType byte) proto.Message {
// 	switch msgType {
// 	case 1:
// 		return &core.Conn{}
// 	case 2:
// 		return &core.Connack{}
// 	case 3:
// 		return &core.Send{}
// 	case 4:
// 		return &core.Sendack{}
// 	case 5:
// 		return &core.Recv{}
// 	case 6:
// 		return &core.Recvack{}
// 	case 7:
// 		return &core.Ping{}
// 	case 8:
// 		return &core.Pong{}
// 	case 9:
// 		return &core.Disconn{}
// 	case 10:
// 		return &core.Sub{}
// 	case 11:
// 		return &core.Suback{}
// 	case 12:
// 		return &core.Unsub{}
// 	case 13:
// 		return &core.Unsuback{}
// 	default:
// 		return nil
// 	}
// }


func messageType(_ message: Message) -> UInt8 {
    switch message.self {
    case is Core_Conn:
        return 1
    case is Core_Connack:
        return 2
    case is Core_Send:
        return 3
    case is Core_Sendack:
        return 4
    case is Core_Recv:
        return 5
    case is Core_Recvack:
        return 6
    case is Core_Ping:
        return 7
    case is Core_Pong:
        return 8
    case is Core_Disconn:
        return 9
    case is Core_Sub:
        return 10
    case is Core_Suback:
        return 11
    case is Core_Unsub:
        return 12
    case is Core_Unsuback:
        return 13
    default:
        return 0
    }
}

func typeOfMessage(_ messageType: UInt8) -> Message? {
    switch messageType {
    case 1:
        return Core_Conn()
    case 2:
        return Core_Connack()
    case 3:
        return Core_Send()
    case 4:
        return Core_Sendack()
    case 5:
        return Core_Recv()
    case 6:
        return Core_Recvack()
    case 7:
        return Core_Ping()
    case 8:
        return Core_Pong()
    case 9:
        return Core_Disconn()
    case 10:
        return Core_Sub()
    case 11:
        return Core_Suback()
    case 12:
        return Core_Unsub()
    case 13:
        return Core_Unsuback()
    default:
        return nil
    }
}

func encode(_ frame: Message) -> Data {
    let messageType = messageType(frame)
    let body = try! frame.serializedData()
    let size=body.count
    var data = Data(capacity: 5 + body.count)
    data.append(messageType)
    data.append(contentsOf: [UInt8((size >> 24) & 0xFF), UInt8((size >> 16) & 0xFF), UInt8((size >> 8) & 0xFF), UInt8(size & 0xFF)])
    data.append(body)
    return data
}

func decode(_ data: Data) -> [Message]? {
    var messages: [Message] = []
    var currentData = data

    while currentData.count >= 5 {
        let messageType = currentData[0]
        let bodySize = Int(currentData[1]) << 24 | Int(currentData[2]) << 16 | Int(currentData[3]) << 8 | Int(currentData[4])
        let bodyOffset: Int = 5

        guard currentData.count >= bodyOffset + bodySize else {
            return nil
        }

        let body = currentData.subdata(in: bodyOffset..<bodyOffset + Int(bodySize))
        guard var message = typeOfMessage(messageType) else {
            return nil
        }

        do {
            try message.merge(serializedData: body)
            messages.append(message)
        } catch {
            return nil
        }

        currentData = currentData.subdata(in: bodyOffset + bodySize..<currentData.count)
    }

    return messages.isEmpty ? nil : messages
}