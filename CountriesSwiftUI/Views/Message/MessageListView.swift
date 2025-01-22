//
//  MessageListView.swift
//  Landmarks
//
//  Created by xsun on 2024/12/14.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftData
import SwiftProtobuf
import SwiftUI

struct MessageListView: View {
    // @State private var messages: [DBModel.Message] = []
    @State private var messageText: String = ""
    @State private var isEditingMessage: Bool = false
    @State private var editingMessageId: UUID?
    @Environment(\.injected) private var injected: DIContainer
    // @State private(set) var messagesState: Loadable<[DBModel.Message]>
    @State private(set) var messagesState: Loadable<Void>

    private let userId = UserDefaults.standard.string(forKey: "userId") ?? ""
    let channel: DomainModel.Channel

    init(channel: DomainModel.Channel,state: Loadable<Void> = .notRequested) {
        self.channel = channel
        self._messagesState = .init(initialValue: .notRequested)
    }

    @ViewBuilder private var content: some View {
        switch messagesState {
        case .notRequested:
            defaultView()
        case .isLoading:
            loadingView()
        case .loaded():
            loadedView()
        case let .failed(error):
            failedView(error)
        }
    }

    var body: some View {
        // content
        // Text("Hello, World!")

        List {
            ForEach(channel.messages) { message in
                Text(message.content)
            }
        }
    }

    // 发送消息
    func sendMessage() {
        // guard !messageText.isEmpty else { return }

        // if let editingMessageId = editingMessageId {
        //     // 编辑现有消息
        //     if let index = messages.firstIndex(where: { $0.id == editingMessageId }) {
        //         messages[index].text = messageText
        //     }
        //     isEditingMessage = false
        // } else {
        //     // 添加新消息
        //     let userMessage = Message(text: messageText, isUserMessage: true)
        //     messages.append(userMessage)
        // }

        injected.interactors.message.send(
            Core_Send.with {
                $0.channelID = channel.id
                $0.channelType = 2
                $0.payload = messageText.data(using: .utf8)!
            })

        // 清空输入框
        messageText = ""

        // // 模拟对方回复
        // DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        //     let response = Message(text: "这是自动回复: \(messageText)", isUserMessage: false)
        //     messages.append(response)
        // }
    }

    // 复制消息
    func copyMessage(_ message: DBModel.Message) {
        // UIPasteboard.general.string = message.text
    }

    // 编辑消息
    func editMessage(_ message: DBModel.Message) {
        // isEditingMessage = true
        // editingMessageId = message.id
    }

    // 删除消息
    func deleteMessage(_ message: DBModel.Message) {
        // if let index = messages.firstIndex(where: { $0.id == message.id }) {
        //     messages.remove(at: index)
        // }
    }
}

// MARK: - Previews

extension MessageListView {
    fileprivate func defaultView() -> some View {
        Text("").onAppear {
            // if !messages.isEmpty {
            //     messagesState = .loaded(())
            // }
            // loadMessagesList(forceReload: false)
            messagesState = .loaded(())
            // messagesState = .isLoading
        }
    }

    fileprivate func loadingView() -> some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
    }

    fileprivate func failedView(_ error: Error) -> some View {
        ErrorView(
            error: error,
            retryAction: {
                // loadCountriesList(forceReload: true)
            })
    }
}

@MainActor
extension MessageListView {
    @ViewBuilder
    fileprivate func loadedView() -> some View {
        VStack(spacing: 0) {
            // 消息显示区域
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        ForEach(channel.messages) { message in
                            Text(message.content)
                            // HStack {
                            //     if message.isFrom(userId: userId) {
                            //         Spacer()
                            //         Text(message.content)
                            //             .id(message.id)
                            //             .padding(10)
                            //             .background(.blue)
                            //             .foregroundColor(.white)
                            //             .cornerRadius(10)
                            //             .contextMenu {
                            //                 Button(action: {
                            //                     copyMessage(message)
                            //                 }) {
                            //                     Label("复制", systemImage: "doc.on.doc")
                            //                 }
                            //                 Button(action: {
                            //                     editMessage(message)
                            //                 }) {
                            //                     Label("编辑", systemImage: "pencil")
                            //                 }
                            //                 Button(action: {
                            //                     deleteMessage(message)
                            //                 }) {
                            //                     Label("删除", systemImage: "trash")
                            //                 }
                            //             }
                            //     } else {
                            //         VStack(alignment: .leading) {
                            //             // Text(message.userID)
                            //             //     .font(.caption)
                            //             //     .padding(.top, 4)
                            //             //     .foregroundColor(.blue)
                            //             Text(message.content)
                            //                 .id(message.id)
                            //                 .padding(10)
                            //                 .background(Color(UIColor.secondarySystemBackground))
                            //                 .foregroundColor(Color(UIColor.label))
                            //                 .cornerRadius(10)
                            //                 .contextMenu {
                            //                     Button(action: {
                            //                         copyMessage(message)
                            //                     }) {
                            //                         Label("复制", systemImage: "doc.on.doc")
                            //                     }
                            //                     Button(action: {
                            //                         editMessage(message)
                            //                     }) {
                            //                         Label("编辑", systemImage: "pencil")
                            //                     }
                            //                     Button(action: {
                            //                         deleteMessage(message)
                            //                     }) {
                            //                         Label("删除", systemImage: "trash")
                            //                     }
                            //                 }
                            //         }
                            //         Spacer()
                            //     }
                            // }
                            // .padding(.horizontal)
                        }
                    }
                }
                // .onChange(of: channel.messages) { oldMessages, newMessages in
                //     let lastMessageID = newMessages.last?.id
                //     proxy.scrollTo(lastMessageID, anchor: .bottom)
                // }
            }
            .onTapGesture {
                hideKeyboard()
            }
            // .background(Color(UIColor.secondarySystemBackground))
            // 输入框和发送按钮
            // HStack {
            //     TextField("输入消息", text: $messageText)
            //         .padding(10)
            //         .background(Color.gray.opacity(0.1))
            //         .cornerRadius(8)
            //         .submitLabel(messageText.isEmpty ? .done : .send)
            //         .onSubmit {
            //             sendMessage()
            //         }
            // }
            // .padding()
            HStack {
                TextField("输入消息", text: $messageText)
                    .padding(8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                // TextEditor(text: $messageText)
                //     .frame(minHeight: 20, maxHeight: 100)  // 限制输入框的高度范围
                //     .padding(.horizontal)
                //     // .background(Color(UIColor.secondarySystemBackground))
                //     .cornerRadius(10)
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(messageText.isEmpty ? .gray : .blue)
                }
                // .padding(.trailing)
            }
            // .padding(.top, 0)
            // .padding(.bottom, 8)
            .padding(.vertical, 8)
            .padding(.horizontal)
            // .background(.ultraThinMaterial)
            // .background(Color(UIColor.secondarySystemBackground))
            // .overlay(
            //     Rectangle()
            //         .frame(height: 1)
            //         .foregroundColor(.gray.opacity(0.5)),
            //     alignment: .top
            // )
        }
        .navigationTitle(channel.name)
        .onChange(of: isEditingMessage) { oldState, newState in
            // if let editingMessageId = editingMessageId,
            //    let editingMessage = messages.first(where: { $0.id == editingMessageId }) {
            //     messageText = editingMessage.text
            // }
        }
        // .query(
        //     searchText: channel.channelID, results: $messages,
        //     { search in
        //         Query(
        //             filter: #Predicate<DBModel.Message> { message in
        //                 message.channelID == search || search.isEmpty
        //             },
        //             sort: \DBModel.Message.messageID)
        //     }
        // )
    }
}


// MARK: - Side Effects

extension MessageListView {

    private func loadMessagesList(forceReload: Bool) {
        // guard forceReload || countries.isEmpty else { return }
        // $messagesState.load {
        //     try await injected.interactors.message.loadMessages(for: channel)
        // }
        messagesState = .loaded(())
    }

}


#if canImport(UIKit)
    extension View {
        func hideKeyboard() {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
#endif
