//
//  View+ButtonTests.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-06-24.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import KeyboardKit
import SwiftUI

class View_ButtonTests: QuickSpec {

    override func spec() {
        
        describe("keyboard button style") {
            
            it("returns a view") {
                let context = KeyboardContext(controller: MockKeyboardInputViewController())
                let appearance = StandardKeyboardAppearance(context: context)
                let result = Text("")
                    .systemKeyboardButtonStyle(
                        appearance.systemKeyboardButtonStyle(for: .backspace, isPressed: true)
                    )
                expect(result).toNot(beNil())
            }
        }
    }
}
