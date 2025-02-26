# DotPageIndicator

A customizable dot-based page indicator for SwiftUI that supports both vertical and horizontal orientations. Perfect for indicating the current position within a collection of items, such as pages in a carousel or sections in a scrollable view.

![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)
![Swift](https://img.shields.io/badge/swift-5.5%2B-orange.svg)
![Platforms](https://img.shields.io/badge/platforms-iOS%2015.0+%20|%20macOS%2012.0+%20|%20tvOS%2014.0+%20|%20watchOS%207.0+-brightgreen.svg)

## Features

- Support for both vertical and horizontal orientations
- Customizable dot appearance (size, spacing, colors)
- Smooth animations with spring effects
- Adaptive scaling and opacity for better visual feedback
- Optional content state indication for each dot
- Multiple built-in styles (default, minimal, dark)
- Background customization with material effects
- iOS 15+, macOS 12+, tvOS 14+, watchOS 7+ support

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/DotPageIndicator.git", from: "1.0.0")
]
```

## System Requirements

- iOS 15.0+
- macOS 12.0+
- tvOS 14.0+
- watchOS 7.0+
- Swift 5.5+

## Usage

### Basic Usage

```swift
@State private var currentPage = 0
let totalPages = 5

// Vertical indicator (default)
DotPageIndicator(
    currentIndex: $currentPage,
    totalItems: totalPages
)
.frame(width: 50)  // Adjust width for vertical orientation

// Horizontal indicator
DotPageIndicator(
    currentIndex: $currentPage,
    totalItems: totalPages,
    style: .init(orientation: .horizontal)
)
.frame(height: 50)  // Adjust height for horizontal orientation
```

### Custom Styling

```swift
DotPageIndicator(
    currentIndex: $currentPage,
    totalItems: totalPages,
    style: DotPageIndicatorStyle(
        orientation: .horizontal,          // Choose orientation
        dotSpacing: 12,                   // Space between dots
        dotSize: 8,                       // Size of each dot
        visibleDots: 5,                   // Number of visible dots
        selectedDotColor: .blue,          // Color of the selected dot
        activeDotColor: .gray,            // Color of active dots
        inactiveDotColor: .gray.opacity(0.3), // Color of inactive dots
        selectedDotScale: 1.4,            // Scale factor for selected dot
        normalDotScale: 0.8               // Scale factor for other dots
    )
)
```

### Built-in Styles

```swift
// Default style
DotPageIndicator(
    currentIndex: $currentPage,
    totalItems: totalPages,
    style: .default
)

// Minimal style (transparent background)
DotPageIndicator(
    currentIndex: $currentPage,
    totalItems: totalPages,
    style: .minimal
)

// Dark style (white dots on dark background)
DotPageIndicator(
    currentIndex: $currentPage,
    totalItems: totalPages,
    style: .dark
)
```

### Content State Indication

```swift
DotPageIndicator(
    currentIndex: $currentPage,
    totalItems: totalPages,
    hasContent: { index in
        // Return true if the item at this index has content
        return true
    }
)
```

## Customization

### Using Built-in Styles

```swift
// Default style
DotPageIndicator(
    currentIndex: $currentPage,
    totalItems: totalPages,
    style: .default
)

// Minimal style
DotPageIndicator(
    currentIndex: $currentPage,
    totalItems: totalPages,
    style: .minimal
)

// Dark style
DotPageIndicator(
    currentIndex: $currentPage,
    totalItems: totalPages,
    style: .dark
)
```

### Custom Style Configuration

```swift
let customStyle = DotPageIndicatorStyle(
    dotSpacing: 12,              // Spacing between dots
    dotSize: 6,                  // Size of each dot
    visibleDots: 7,             // Number of visible dots
    indicatorWidth: 20,         // Width of the indicator
    verticalPadding: 8,         // Vertical padding
    horizontalPadding: 4,       // Horizontal padding
    backgroundCornerRadius: 20, // Corner radius of background
    backgroundColor: AnyShapeStyle(.ultraThinMaterial),
    selectedDotColor: .blue,    // Color for selected dot
    activeDotColor: .blue.opacity(0.4), // Color for active dots
    inactiveDotColor: .gray.opacity(0.2), // Color for inactive dots
    selectedDotScale: 1.4,      // Scale for selected dot
    normalDotScale: 0.8,        // Scale for normal dots
    selectedDotOpacity: 1.0,    // Opacity for selected dot
    normalDotOpacity: 0.2,      // Opacity for normal dots
    animationResponse: 0.3,     // Animation response time
    animationDampingFraction: 0.8 // Animation damping
)

DotPageIndicator(
    currentIndex: $currentPage,
    totalItems: totalPages,
    style: customStyle
)
```

## License

DotPageIndicator is available under the MIT license. See the LICENSE file for more info.
