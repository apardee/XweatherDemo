//
//  DemoMap.swift
//  XWeatherDemo
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps
import SwiftUI
import XWeatherMapbox

struct DemoMap: View {
	
	let state: DemoMapState
	
	@State private var viewport: Viewport = .camera(center: .minneapolis, zoom: 4)
	
	@State private var mapBounds: CoordinateBounds? = nil
	
	@State private var pendingMapBounds: CoordinateBounds? = nil
	
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
			.onCameraChanged { cameraChanged in
				guard let mapboxMap = proxy.map else { return }
				pendingMapBounds = mapboxMap.coordinateBounds(forCameraState: cameraChanged.cameraState)
			}
			.onMapIdle { _ in
				// Using onMapIdle to apply the visible bounds used by the earthquake map source.
				// This convention matches the refresh behavior of the layers and avoids content drop
				// out in between source update and map idle (e.g. when panning the map).
				mapBounds = pendingMapBounds
			}
			.mapStyle(.dark)
			.ignoresSafeArea()
		}
	}
}
