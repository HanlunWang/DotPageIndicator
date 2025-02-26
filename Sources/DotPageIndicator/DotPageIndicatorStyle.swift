import SwiftUI

/// Style configuration for the DotPageIndicator
public struct DotPageIndicatorStyle {
    /// Orientation of the dot page indicator
    public enum Orientation {
        case vertical
        case horizontal
    }
    
    /// Scroll direction of the dot page indicator
    public enum ScrollDirection {
        case natural   // top to bottom for vertical, left to right for horizontal
        case reversed  // bottom to top for vertical, right to left for horizontal
    }
    
    /// The orientation of the indicator
    public let orientation: Orientation
    
    /// The scroll direction of the indicator
    public let scrollDirection: ScrollDirection
    
    /// Spacing between dots
    public let dotSpacing: CGFloat
    
    /// Size of each dot
    public let dotSize: CGFloat
    
    /// Number of visible dots
    public let visibleDots: Int
    
    /// Width of the indicator container
    public let indicatorWidth: CGFloat
    
    /// Vertical padding for the container
    public let verticalPadding: CGFloat
    
    /// Horizontal padding for the container
    public let horizontalPadding: CGFloat
    
    /// Corner radius of the background
    public let backgroundCornerRadius: CGFloat
    
    /// Background material or color
    public let backgroundColor: AnyShapeStyle
    
    /// Color for the selected dot
    public let selectedDotColor: Color
    
    /// Color for active dots (with content)
    public let activeDotColor: Color
    
    /// Color for inactive dots (without content)
    public let inactiveDotColor: Color
    
    /// Scale for the selected dot
    public let selectedDotScale: CGFloat
    
    /// Scale for normal dots
    public let normalDotScale: CGFloat
    
    /// Opacity for the selected dot
    public let selectedDotOpacity: Double
    
    /// Opacity for normal dots
    public let normalDotOpacity: Double
    
    /// Animation response time
    public let animationResponse: Double
    
    /// Animation damping fraction
    public let animationDampingFraction: Double
    
    /// Creates a new style configuration
    public init(
        orientation: Orientation = .vertical,
        scrollDirection: ScrollDirection = .natural,
        dotSpacing: CGFloat = 12,
        dotSize: CGFloat = 6,
        visibleDots: Int = 7,
        indicatorWidth: CGFloat = 20,
        verticalPadding: CGFloat = 8,
        horizontalPadding: CGFloat = 4,
        backgroundCornerRadius: CGFloat = 20,
        backgroundColor: AnyShapeStyle = AnyShapeStyle(.ultraThinMaterial),
        selectedDotColor: Color = .primary,
        activeDotColor: Color = .primary.opacity(0.4),
        inactiveDotColor: Color = .secondary.opacity(0.2),
        selectedDotScale: CGFloat = 1.4,
        normalDotScale: CGFloat = 0.8,
        selectedDotOpacity: Double = 1.0,
        normalDotOpacity: Double = 0.2,
        animationResponse: Double = 0.3,
        animationDampingFraction: Double = 0.8
    ) {
        self.orientation = orientation
        self.scrollDirection = scrollDirection
        self.dotSpacing = dotSpacing
        self.dotSize = dotSize
        self.visibleDots = visibleDots
        self.indicatorWidth = indicatorWidth
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.backgroundCornerRadius = backgroundCornerRadius
        self.backgroundColor = backgroundColor
        self.selectedDotColor = selectedDotColor
        self.activeDotColor = activeDotColor
        self.inactiveDotColor = inactiveDotColor
        self.selectedDotScale = selectedDotScale
        self.normalDotScale = normalDotScale
        self.selectedDotOpacity = selectedDotOpacity
        self.normalDotOpacity = normalDotOpacity
        self.animationResponse = animationResponse
        self.animationDampingFraction = animationDampingFraction
    }
    
    /// Default style
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public static var `default`: DotPageIndicatorStyle {
        DotPageIndicatorStyle()
    }
    
    /// Minimal style with a transparent background
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public static var minimal: DotPageIndicatorStyle {
        DotPageIndicatorStyle(
            verticalPadding: 4,
            horizontalPadding: 2,
            backgroundCornerRadius: 10,
            backgroundColor: AnyShapeStyle(Color.clear)
        )
    }
    
    /// Dark style with white dots
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public static var dark: DotPageIndicatorStyle {
        DotPageIndicatorStyle(
            backgroundColor: AnyShapeStyle(Color.black.opacity(0.6)),
            selectedDotColor: .white,
            activeDotColor: .white.opacity(0.6),
            inactiveDotColor: .white.opacity(0.3)
        )
    }
}

extension ShapeStyle {
    /// Converts any ShapeStyle to AnyShapeStyle for storage
    public func eraseToAnyShapeStyle() -> AnyShapeStyle {
        AnyShapeStyle(self)
    }
} 