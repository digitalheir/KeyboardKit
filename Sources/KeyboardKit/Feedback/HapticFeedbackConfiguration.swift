//
//  HapticFeedbackConfiguration.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2019-10-15.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This struct specifies haptic feedback for a custom keyboard.
 
 `TODO` Make this `Codable` (which requires Xcode 13) in 5.0.
 */
public struct HapticFeedbackConfiguration: Equatable {
    
    public init(
        tapFeedback: HapticFeedback = .none,
        doubleTapFeedback: HapticFeedback = .none,
        longPressFeedback: HapticFeedback = .none,
        longPressOnSpaceFeedback: HapticFeedback = .mediumImpact,
        repeatFeedback: HapticFeedback = .none) {
        self.tapFeedback = tapFeedback
        self.doubleTapFeedback = doubleTapFeedback
        self.longPressFeedback = longPressFeedback
        self.longPressOnSpaceFeedback = longPressOnSpaceFeedback
        self.repeatFeedback = repeatFeedback
    }
 
    public let tapFeedback: HapticFeedback
    public let doubleTapFeedback: HapticFeedback
    public let longPressFeedback: HapticFeedback
    public let longPressOnSpaceFeedback: HapticFeedback
    public let repeatFeedback: HapticFeedback
    
    /**
     This configuration disables all haptic feedback.
     */
    public static var noFeedback: HapticFeedbackConfiguration {
        HapticFeedbackConfiguration(
            tapFeedback: .none,
            doubleTapFeedback: .none,
            longPressFeedback: .none,
            longPressOnSpaceFeedback: .none,
            repeatFeedback: .none
        )
    }
    
    /**
     This configuration specifies a standard haptic feedback.
    */
    public static var standard: HapticFeedbackConfiguration {
        HapticFeedbackConfiguration()
    }
}
