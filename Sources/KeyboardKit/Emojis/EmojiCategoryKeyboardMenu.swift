//
//  EmojiCategoryKeyboardMenu.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-17.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to list a set of emoji categories and
 let each category button toggle a category selection.
 
 The menu buttons are also surrounded by a keyboard switcher
 and a backspace.

 The menu currently has little customizations. We can extend
 it after 4.0, when everything resides in the main repo.
 */
@available(iOS 14.0, *)
public struct EmojiCategoryKeyboardMenu: View {
    
    public init(
        categories: [EmojiCategory] = EmojiCategory.all,
        selection: Binding<EmojiCategory>,
        configuration: EmojiKeyboardConfiguration,
        selectedColor: Color = Color.black.opacity(0.1)) {
        self.categories = categories.filter { $0.emojis.count > 0 }
        self._selection = selection
        self.configuration = configuration
        self.selectedColor = selectedColor
    }
    
    private let categories: [EmojiCategory]
    private let configuration: EmojiKeyboardConfiguration
    private let selectedColor: Color
    
    @State private var isInitialized = false
    @Binding private var selection: EmojiCategory
    
    @EnvironmentObject private var context: KeyboardContext
    
    public var body: some View {
        HStack(spacing: 0) {
            Spacer()
            keyboardSwitchButton
            Spacer()
            buttonList
            Spacer()
            backspaceButton
            Spacer()
        }
        .font(configuration.categoryFont)
    }
    
    
    // MARK: - Private Extensions (here to make preview work)
    
    private var backspaceButton: some View {
        let action = KeyboardAction.backspace
        let handler = KeyboardInputViewController.shared.keyboardActionHandler
        let image = action.standardButtonImage(for: context)
        return image.keyboardGestures(
            for: action,
            context: context,
            actionHandler: handler).scaledToFill()
    }
    
    private var keyboardSwitchButton: some View {
        let action = KeyboardAction.keyboardType(.alphabetic(.lowercased))
        let handler = KeyboardInputViewController.shared.keyboardActionHandler
        let text = action.standardButtonText(for: context) ?? ""
        return Text(text).keyboardGestures(
            for: action,
            context: context,
            actionHandler: handler).scaledToFill()
    }
    
    private var buttonList: some View {
        ForEach(categories) {
            buttonListItem(for: $0)
        }
    }
    
    private func buttonListItem(for category: EmojiCategory) -> some View {
        let action = { selection = category }
        return Button(action: action) {
            Text(category.fallbackDisplayEmoji.char)
                .padding(6)
                .background(selection == category ? selectedColor : Color.clear)
                .clipShape(Circle())
        }
    }
}

@available(iOS 14.0, *)
struct EmojiCategoryKeyboardMenu_Previews: PreviewProvider {
    static var previews: some View {
        EmojiCategoryKeyboardMenu(selection: .constant(.activities), configuration: .standardPhonePortrait)
            .keyboardPreview()
    }
}
