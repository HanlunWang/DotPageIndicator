# DotPageIndicator

A beautiful and customizable vertical dot-based page indicator for SwiftUI that shows the current position within a collection of items. Perfect for page views, carousels, and onboarding flows.

![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)
![Swift](https://img.shields.io/badge/swift-5.5%2B-orange.svg)
![Platforms](https://img.shields.io/badge/platforms-iOS%2015.0+%20|%20macOS%2012.0+%20|%20tvOS%2014.0+%20|%20watchOS%207.0+-brightgreen.svg)

## Features

- Vertical dot-based page indicator
- Smooth animations with spring physics
- Highly customizable appearance
- Easy integration with SwiftUI views
- Support for multiple styling options
- Adaptive dot scaling and opacity

## Installation

### Swift Package Manager

Add DotPageIndicator to your project through Xcode:

1. Go to `File` > `Add Packages...`
2. Enter the package URL: `https://github.com/wanghanlun/DotPageIndicator.git`
3. Click `Add Package`

Or add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/wanghanlun/DotPageIndicator.git", from: "1.0.0")
]
```

## System Requirements

- iOS 15.0+
- macOS 12.0+
- tvOS 14.0+
- watchOS 7.0+
- Swift 5.5+

## Usage

### Basic Implementation

```swift
import SwiftUI
import DotPageIndicator

struct ContentView: View {
    @State private var currentPage = 0
    let totalPages = 5

    var body: some View {
        HStack {
            DotPageIndicator(
                currentIndex: $currentPage,
                totalItems: totalPages
            )
            .frame(width: 50)

            // Your page content here
        }
    }
}
```

### View Extension Usage

```swift
import SwiftUI
import DotPageIndicator

struct ContentView: View {
    @State private var currentPage = 0
    let totalPages = 5

    var body: some View {
        TabView(selection: $currentPage) {
            // Your pages here
        }
        .tabViewStyle(.page)
        .dotPageIndicator(
            currentIndex: $currentPage,
            totalItems: totalPages,
            alignment: .trailing
        )
    }
}
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

### Content Awareness

You can specify which items have content using the `hasContent` parameter:

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

## License

DotPageIndicator is available under the MIT license. See the LICENSE file for more info.
