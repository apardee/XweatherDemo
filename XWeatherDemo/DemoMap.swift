//
//  DemoMap.swift
//  XWeatherDemo
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps
import SwiftUI
import XWeatherMapbox

/// A demonstration SwiftUI view that showcases the integration of XWeatherMapbox with Mapbox's SwiftUI API.
///
/// `DemoMap` serves as a practical example of how to build weather-enabled map applications using
/// the XWeatherMapbox package alongside Mapbox Maps SDK for SwiftUI. This implementation demonstrates
/// how to layer multiple weather data sources onto a map with dynamic visibility and opacity controls.
///
/// The view integrates the following XWeatherMapbox features:
/// - **Radar Data**: Real-time precipitation visualization using `RasterMapContent`
/// - **Weather Alerts**: Active weather warnings and advisories overlay
/// - **Earthquake Data**: Seismic activity display with both heatmap and marker presentation modes
///
/// Key integration patterns demonstrated:
/// - State-driven layer management through `DemoMapState`
/// - Dynamic map bounds handling for data-dependent layers (earthquakes)
/// - Proper camera change and map idle event handling
/// - Layer opacity and visibility controls
///
/// Use this implementation as a reference for building your own weather-enabled mapping applications
/// with XWeatherMapbox and Mapbox SwiftUI.
struct DemoMap: View {
	
	let state: DemoMapState
	
	@State private var viewport: Viewport = .camera(center: .minneapolis, zoom: 4)
	
	@State private var mapBounds: CoordinateBounds? = nil
	
	var body: some View {
		MapReader { proxy in
			Map(viewport: $viewport) {
				
				// Add radar source and layer to the map.
				if state.isRadarLayerEnabled {
					RasterMapContent(type: .radar)
						.rasterOpacity(state.radarLayerOpacity)
				}

				// Add alert source and layer to the map.
				if state.isAlertsLayerEnabled {
					RasterMapContent(type: .alerts)
						.rasterOpacity(state.alertsLayerOpacity)
				}
				
				// Add earthquake source to the map and conditionally add either
				// the heatmap or marker layer, driven by the mode.
				// NOTE: The earthquake source requires the current map view's
				// coordinate bounds in order to request data for the visible region.
				if let mapBounds, state.isEarthquakeLayerEnabled {
					EarthquakeMapContent(mapBounds: mapBounds,
										 mode: state.earthquakeLayerMode,
										 opacity: state.earthquakeLayerOpacity)
				}
			}
			.onMapLoaded { _ in
				try? proxy.map?.setProjection(.init(name: .mercator))
			}
			.onMapIdle { _ in
				// Using onMapIdle to apply the visible bounds used by the earthquake map source.
				// This convention matches the refresh behavior of the layers and avoids content drop
				// out in between source update and map idle (e.g. when panning the map).
				guard let map = proxy.map, let cameraState = proxy.map?.cameraState else {
					return
				}
				mapBounds = map.coordinateBounds(forCameraState: cameraState)
			}
			.mapStyle(.dark)
			.ignoresSafeArea()
		}
	}
}
