import SwiftUI

/// A single dot in the page indicator
internal struct DotView: View {
    /// Whether the item at this position has content
    let hasContent: Bool
    
    /// Whether this dot should be empty/invisible
    let isEmpty: Bool
    
    /// The center Y position of the container
    let centerY: CGFloat
    
    /// The current Y position of this dot
    let currentY: CGFloat
    
    /// Style configuration
    let style: DotPageIndicatorStyle
    
    /// The distance of this dot from the center position
    private var distanceFromCenter: CGFloat {
        abs(centerY - (currentY + centerY))
    }
    
    /// Whether this dot is currently selected (centered)
    private var isSelected: Bool {
        distanceFromCenter < 1
    }
    
    /// The progress value (0-1) based on distance from center
    private var progress: CGFloat {
        let maxDistance = style.dotSpacing * 3
        return max(0, 1 - (distanceFromCenter / maxDistance))
    }
    
    var body: some View {
        Circle()
            .fill(dotColor)
            .frame(width: style.dotSize, height: style.dotSize)
            .scaleEffect(scaleEffect)
            .opacity(opacity)
            .offset(y: currentY)
    }
    
    /// The color of the dot based on its state
    private var dotColor: Color {
        if isEmpty { return .clear }
        if isSelected { return style.selectedDotColor }
        return hasContent ? style.activeDotColor : style.inactiveDotColor
    }
    
    /// The scale effect based on the dot's state
    private var scaleEffect: CGFloat {
        if isEmpty { return 0 }
        if isSelected { return style.selectedDotScale }
        return style.normalDotScale + (progress * 0.2)
    }
    
    /// The opacity based on the dot's state
    private var opacity: Double {
        if isEmpty { return 0 }
        if isSelected { return style.selectedDotOpacity }
        return style.normalDotOpacity + (progress * 0.4)
    }
} 