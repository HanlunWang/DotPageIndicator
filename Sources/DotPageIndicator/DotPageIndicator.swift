// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

/// A vertical dot-based page indicator that shows the current position within a collection of items
public struct DotPageIndicator: View {
    /// The current index being displayed
    @Binding private var currentIndex: Int
    
    /// The total number of items to represent as dots
    private let totalItems: Int
    
    /// Optional closure to determine if an item at a specific index has content
    private let hasContent: ((Int) -> Bool)?
    
    /// Style configuration for the indicator
    private let style: DotPageIndicatorStyle
    
    /// Creates a new dot page indicator
    /// - Parameters:
    ///   - currentIndex: Binding to the current index
    ///   - totalItems: Total number of items to display as dots
    ///   - style: Style configuration for the indicator (optional)
    ///   - hasContent: Optional closure to determine if an item has content
    public init(
        currentIndex: Binding<Int>,
        totalItems: Int,
        style: DotPageIndicatorStyle = .default,
        hasContent: ((Int) -> Bool)? = nil
    ) {
        self._currentIndex = currentIndex
        self.totalItems = totalItems
        self.style = style
        self.hasContent = hasContent
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let centerY = geometry.size.height / 2
            ZStack {
                ForEach(0..<totalItems, id: \.self) { index in
                    DotView(
                        hasContent: hasContent?(index) ?? true,
                        isEmpty: false,
                        centerY: centerY,
                        currentY: getDotPosition(for: index),
                        style: style
                    )
                    .animation(.spring(response: style.animationResponse, 
                                      dampingFraction: style.animationDampingFraction), 
                              value: currentIndex)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: style.indicatorWidth, 
               height: CGFloat(style.visibleDots) * style.dotSpacing)
        .clipped()
        .padding(.vertical, style.verticalPadding)
        .padding(.horizontal, style.horizontalPadding)
        .background(
            RoundedRectangle(cornerRadius: style.backgroundCornerRadius)
                .fill(style.backgroundColor)
        )
    }
    
    private func getDotPosition(for index: Int) -> CGFloat {
        let offset = CGFloat(currentIndex - index) * style.dotSpacing
        return offset
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var currentIndex = 2
        let totalItems = 10
        
        var body: some View {
            HStack {
                DotPageIndicator(
                    currentIndex: $currentIndex,
                    totalItems: totalItems
                )
                .frame(width: 50)
                
                Spacer()
                
                VStack {
                    Button("Previous") {
                        if currentIndex > 0 {
                            currentIndex -= 1
                        }
                    }
                    
                    Text("Page \(currentIndex + 1) of \(totalItems)")
                    
                    Button("Next") {
                        if currentIndex < totalItems - 1 {
                            currentIndex += 1
                        }
                    }
                }
                .padding()
            }
            .padding()
        }
    }
    
    return PreviewWrapper()
}
