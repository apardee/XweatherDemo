# XWeatherDemo

Basic library + demo iOS App with support for the display of Xweather content on a Mapbox map.

## System Requirements

* Building the application: Xcode 16.0+
* Running the app: iOS 16.0+ device or simulator.

## Prerequisites

### Configure API Access
Before running the project, the following API credentials are required:

1. **Mapbox Access Token**: 
   - Create an account at [Mapbox](https://www.mapbox.com/)
   - Generate a public access token

2. **XWeather API Credentials**:
   - Sign up at [XWeather](https://www.xweather.com/)
   - Obtain your Client ID and Secret

## Building & Running
Follow the instructions in this section to build and test the demo application locally:

### Clone and open the project

1. Clone the repository:
   ```bash
   git clone https://github.com/apardee/XweatherDemo.git
   cd XweatherDemo
   ```

2. Open `XWeatherDemo.xcodeproj` in Xcode

3. In the project's `XWeatherDemo/Info.plist` configuration file, update the following values:
   ```xml
   <key>MBXAccessToken</key>
   <string>YOUR_MAPBOX_ACCESS_TOKEN</string>
   <key>XWeatherClientID</key>
   <string>YOUR_XWEATHER_CLIENT_ID</string>
   <key>XWeatherSecret</key>
   <string>YOUR_XWEATHER_SECRET</string>
   ```

4. If running on a physical device instead of the iOS simulator, navigate to the project's `Signing & Capability` tab and set the `Team` drop down to a valid team associated with the logged in user.

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

## API Documentation

- [Mapbox iOS SDK](https://docs.mapbox.com/ios/maps/)
- [XWeather API Documentation](https://www.xweather.com/docs/)
