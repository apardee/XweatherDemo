# XWeatherDemo

A SwiftUI iOS application demonstrating weather data visualization using XWeather and Mapbox integration.

## Requirements

### System Requirements
- iOS 16.0+
- Xcode 16.0+

### Dependencies
- **MapboxMaps**: Mapbox SDK for iOS mapping functionality
- **XWeatherMapbox**: XWeather integration library for weather data overlays
- **SwiftUI**: Apple's declarative UI framework

## Setup

### Prerequisites
Before running the project, you'll need to obtain API credentials:

1. **Mapbox Access Token**: 
   - Create an account at [Mapbox](https://www.mapbox.com/)
   - Generate a public access token

2. **XWeather API Credentials**:
   - Sign up at [XWeather](https://www.xweather.com/)
   - Obtain your Client ID and Secret

### Configuration

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd XWeatherDemo
   ```

2. Configure API credentials in `XWeatherDemo/Info.plist`:
   ```xml
   <key>MBXAccessToken</key>
   <string>YOUR_MAPBOX_ACCESS_TOKEN</string>
   <key>XWeatherClientID</key>
   <string>YOUR_XWEATHER_CLIENT_ID</string>
   <key>XWeatherSecret</key>
   <string>YOUR_XWEATHER_SECRET</string>
   ```

3. Open `XWeatherDemo.xcodeproj` in Xcode

4. Build and run the project

## Usage

### Features
- **Interactive Map**: Pan and zoom to explore different geographical areas
- **Weather Layers**: Toggle various weather data overlays including:
  - Radar data visualization
  - Customizable layer opacity controls
- **Layer Selection**: Use the layers button (top-right) to:
  - Enable/disable weather layers
  - Adjust layer opacity
  - Switch between different weather data types

### Controls
- **Layers Button**: Circular button with layer icon in the top-right corner
- **Map Interaction**: Standard pinch-to-zoom and pan gestures
- **Layer Popover**: Tap the layers button to access weather layer controls

## Project Structure

```
XWeatherDemo/
├── XWeatherDemo/
│   ├── XWeatherDemoApp.swift      # Main app entry point
│   ├── ContentView.swift          # Main UI view
│   ├── DemoMap.swift             # Map component with weather layers
│   ├── DemoMapState.swift        # State management for map layers
│   ├── DemoMapLayerSelection.swift # Layer selection UI
│   ├── Extensions.swift          # Swift extensions and utilities
│   ├── Info.plist               # App configuration and API keys
│   └── Assets.xcassets/         # App icons and visual assets
├── XWeatherMapbox/              # XWeather integration framework
└── XWeatherDemo.xcodeproj/      # Xcode project file
```

## Architecture

- **SwiftUI**: Modern declarative UI framework
- **MVVM Pattern**: State management using `@State` and observable objects
- **Mapbox Integration**: Native iOS mapping with custom weather overlays
- **XWeather SDK**: Professional weather data integration

## Development

### Building

```bash
# Open in Xcode
open XWeatherDemo.xcodeproj

# Or use xcodebuild
xcodebuild -project XWeatherDemo.xcodeproj -scheme XWeatherDemo -destination 'platform=iOS Simulator,name=iPhone 15' build
```

## API Documentation

- [Mapbox iOS SDK](https://docs.mapbox.com/ios/maps/)
- [XWeather API Documentation](https://www.xweather.com/docs/)
