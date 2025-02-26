import SwiftUI

public extension View {
    /// Adds a dot page indicator to the view
    /// - Parameters:
    ///   - currentIndex: Binding to the current index
    ///   - totalItems: Total number of items to display as dots
    ///   - style: Style configuration for the indicator
    ///   - hasContent: Optional closure to determine if an item has content
    ///   - alignment: Alignment of the indicator within the view
    /// - Returns: A view with the dot page indicator
    func dotPageIndicator(
        currentIndex: Binding<Int>,
        totalItems: Int,
        style: DotPageIndicatorStyle = .default,
        hasContent: ((Int) -> Bool)? = nil,
        alignment: Alignment = .leading
    ) -> some View {
        overlay(
            DotPageIndicator(
                currentIndex: currentIndex,
                totalItems: totalItems,
                style: style,
                hasContent: hasContent
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .padding()
        )
    }
} 