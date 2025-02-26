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
            let centerPosition = style.orientation == .vertical ? 
                geometry.size.height / 2 : 
                geometry.size.width / 2
            
            ZStack {
                ForEach(0..<totalItems, id: \.self) { index in
                    DotView(
                        hasContent: hasContent?(index) ?? true,
                        isEmpty: false,
                        centerPosition: centerPosition,
                        currentPosition: getDotPosition(for: index),
                        style: style
                    )
                    .animation(.spring(response: style.animationResponse, 
                                     dampingFraction: style.animationDampingFraction), 
                             value: currentIndex)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(
            width: style.orientation == .vertical ? style.indicatorWidth : (CGFloat(style.visibleDots) * style.dotSpacing),
            height: style.orientation == .vertical ? (CGFloat(style.visibleDots) * style.dotSpacing) : style.indicatorWidth
        )
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
        return style.scrollDirection == .natural ? offset : -offset
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var currentIndex = 2
        let totalItems = 10
        
        var body: some View {
            ZStack {
                // Beautiful animated gradient background
                LinearGradient(
                    colors: [.blue, .purple, .pink],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .opacity(0.3)
                .ignoresSafeArea()
                
                // Add some floating circles for visual interest
                GeometryReader { geometry in
                    ZStack {
                        ForEach(0..<5) { index in
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [.blue.opacity(0.2), .purple.opacity(0.2)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: CGFloat.random(in: 100...200))
                                .position(
                                    x: CGFloat.random(in: 0...geometry.size.width),
                                    y: CGFloat.random(in: 0...geometry.size.height)
                                )
                                .blur(radius: 20)
                        }
                    }
                }

                VStack(spacing: 40) {
                    Text("Vertical Indicators")
                        .font(.headline)
                    
                    HStack(spacing: 40) {
                        // Natural vertical (top to bottom)
                        VStack {
                            Text("Natural")
                                .font(.caption)
                            DotPageIndicator(
                                currentIndex: $currentIndex,
                                totalItems: totalItems,
                                style: .init(
                                    orientation: .vertical,
                                    scrollDirection: .natural
                                )
                            )
                            .frame(width: 50)
                        }
                        
                        // Reversed vertical (bottom to top)
                        VStack {
                            Text("Reversed")
                                .font(.caption)
                            DotPageIndicator(
                                currentIndex: $currentIndex,
                                totalItems: totalItems,
                                style: .init(
                                    orientation: .vertical,
                                    scrollDirection: .reversed
                                )
                            )
                            .frame(width: 50)
                        }
                        
                        VStack {
                            Button("Previous") {
                                if currentIndex > 0 {
                                    currentIndex -= 1
                                }
                            }
                            .buttonStyle(.bordered)
                            
                            Text("Page \(currentIndex + 1) of \(totalItems)")
                            
                            Button("Next") {
                                if currentIndex < totalItems - 1 {
                                    currentIndex += 1
                                }
                            }
                            .buttonStyle(.bordered)
                        }
                        .frame(width: 120)
                        .padding()
                    }
                    
                    Text("Horizontal Indicators")
                        .font(.headline)
                    
                    VStack(spacing: 40) {
                        // Natural horizontal (left to right)
                        VStack {
                            Text("Natural")
                                .font(.caption)
                            DotPageIndicator(
                                currentIndex: $currentIndex,
                                totalItems: totalItems,
                                style: .init(
                                    orientation: .horizontal,
                                    scrollDirection: .natural
                                )
                            )
                            .frame(height: 50)
                        }
                        
                        // Reversed horizontal (right to left)
                        VStack {
                            Text("Reversed")
                                .font(.caption)
                            DotPageIndicator(
                                currentIndex: $currentIndex,
                                totalItems: totalItems,
                                style: .init(
                                    orientation: .horizontal,
                                    scrollDirection: .reversed
                                )
                            )
                            .frame(height: 50)
                        }
                    }
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding()
            }
        }
    }
    
    return PreviewWrapper()
}
