# XweatherDemo

This project contains a library and demo application using SwiftUI & Mapbox to display Xweather content on an interactive map. The Mapbox SDK was chosen for cross-platform compatibility, a featureset that closely matched the needs of this demo, and prior familiarity with the SDK.

The project is split into two parts: the `XWeatherMapbox` package and top-level demo app making use of that package. This separation is overkill for a simple demo, but the separation is meant to show that the API as capable of providing a simple and easy to use interface with progressive disclosure of more advanced configuration.

Here's a simple example of how the `XWeatherMapbox` package can be used to add content directly to a `MapboxMap` (see [DemoMap](XWeatherDemo/DemoMap.swift) for a more detailed example):

```swift
import SwiftUI
import MapboxMaps
import XWeatherMapbox

struct MyWeatherMap: View {
    @State private var mapBounds: CoordinateBounds? = nil
    
    var body: some View {
        MapReader { proxy in
            Map(viewport: $viewport) {
                // Add radar layer
                RasterMapContent(type: .radar)
                    .rasterOpacity(0.7)
                
                // Add weather alerts
                RasterMapContent(type: .alerts)
                    .rasterOpacity(0.8)
                
                // Add earthquake data (requires map bounds)
                if let mapBounds {
                    EarthquakeMapContent(mapBounds: mapBounds, 
                                       mode: .marker, 
                                       opacity: 0.6)
                }
            }
            .onMapIdle { _ in
                mapBounds = proxy.map?.coordinateBounds(for: proxy.map?.cameraState ?? CameraState())
            }
        }
    }
}
```

## System Requirements

* Building the application: Xcode 16.0+
* Running the app: iOS 18.0+ device or simulator.

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

3. In the project file navigator on the left pane, select the `XWeatherDemo` project and navigate to the `Info` pane. Update the `MBXAccessToken` (Mapbox access token), `XWeatherClientID`, and `XWeatherSecret` values based on the credentials acquired in the prerequisite steps.

<img width="779" height="126" alt="Screenshot 2025-09-01 at 4 44 14 PM" src="https://github.com/user-attachments/assets/7e3b63d8-0880-4218-9837-6fe3e6c4cc46" />

> [!TIP]
> This configuration can also be made directly to the [Info.plist](XWeatherDemo/Info.plist)

4. If running on a physical device instead of the iOS simulator, navigate to the project's `Signing & Capability` tab and set the `Team` drop down to a valid team associated with the logged in user.

5. Build and run the application.

## Usage

When the application launches, all available map layers are enabled. To configure the state of the map, open the layer selection UI using the button on the top right corner of the map:

<img width="369" height="592" alt="Screenshot 2025-09-01 at 4 50 33 PM" src="https://github.com/user-attachments/assets/c0b91179-d4d8-4383-8713-95c92f564879" />

## Project Structure

```
XWeatherDemo/
├── XWeatherDemo/                    # Demo map application using the XWeatherMapbox package
│   ├── XWeatherDemoApp.swift        # Main app entry point
│   ├── ContentView.swift            # Main UI view
│   ├── DemoMap.swift                # Map component with weather layers
│   ├── DemoMapState.swift           # State management for map layers
│   ├── DemoMapLayerSelection.swift  # Layer selection UI
│   ├── Extensions.swift             # Swift extensions and utilities
│   ├── Info.plist                   # App configuration and API keys
│   └── Assets.xcassets/             # App icons and visual assets
├── XWeatherMapbox/                  # XWeather integration framework
└── XWeatherDemo.xcodeproj/          # Xcode project file
```

## API Documentation

- [Mapbox iOS SDK](https://docs.mapbox.com/ios/maps/)
- [XWeather API Documentation](https://www.xweather.com/docs/)
