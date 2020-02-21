//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
        func testFetchMessageThreads() {
            let expectation1 = self.expectation(description: "No Error")

            MessageThreadController().fetchMessageThreads { error in
                if error == nil {
                    expectation1.fulfill()
                }
            }
            self.wait(for: [expectation1], timeout: 2)
        }
        
        func testMessageThread() {
            let title = "Hey, ...!"
            XCTAssertEqual(MessageThread(title: title).title, "Hey, ...!")
        }
        
    }
