//
//  EarthquakeMapContent.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps

/// A map content component that displays earthquake data on a Mapbox map.
///
/// `EarthquakeMapContent` provides an easy way to visualize earthquake data within specified geographic bounds.
/// The earthquakes can be displayed either as individual markers or as a heatmap showing earthquake density.
///
/// ## Usage
///
/// ```swift
/// // Display earthquake markers within the current map bounds
/// EarthquakeMapContent(mapBounds: mapBounds, mode: .marker)
///
/// // Display earthquake heatmap with custom opacity
/// EarthquakeMapContent(mapBounds: mapBounds, mode: .heatmap)
///     .opacity(0.8)
/// ```
public struct EarthquakeMapContent: MapContent {
	
	/// The display mode for earthquake visualization.
	public enum Mode {
		/// Display earthquakes as individual point markers on the map.
		case marker
		/// Display earthquakes as a density heatmap showing concentration areas.
		case heatmap
	}
	
	/// Creates a new earthquake map content component.
	///
	/// - Parameters:
	///   - mapBounds: The geographic bounds within which to request earthquake data.
	///   - mode: The visualization mode (marker or heatmap). Defaults to `.marker`.
	///   - opacity: The opacity level for the earthquake layer (0.0 to 1.0). Defaults to `1.0`.
	///   - earthquakeSourceId: Custom identifier for the earthquake data source. Uses default if not specified.
	///   - earthquakeHeatmapLayerId: Custom identifier for the heatmap layer. Uses default if not specified.
	///   - earthquakeMarkerLayerId: Custom identifier for the marker layer. Uses default if not specified.
	public init(mapBounds: CoordinateBounds,
				mode: Mode = .marker,
				opacity: Double = 1.0,
				earthquakeSourceId: String = Constants.defaultEarthquakeSourceId,
				earthquakeHeatmapLayerId: String = Constants.defaultEarthquakeHeatmapLayerId,
				earthquakeMarkerLayerId: String = Constants.defaultEarthquakeMarkerLayerId) {
		self.mapBounds = mapBounds
		self.mode = mode
		self.opacity = opacity
		self.earthquakeSourceId = earthquakeSourceId
		self.earthquakeHeatmapLayerId = earthquakeHeatmapLayerId
		self.earthquakeMarkerLayerId = earthquakeMarkerLayerId
	}
	
	/// The map content body that configures earthquake visualization layers.
	///
	/// This computed property creates the necessary map source and layer components
	/// based on the specified mode and configuration parameters.
	public var body: some MapContent {
		
		// shared source used by both layers
		EarthquakeSourceContent(bounds: mapBounds)
		
		// heatmap vs. point marker layer is conditional based on the mode
		switch mode {
		case .marker:
			EarthquakeMarkerLayerContent(layerId: earthquakeMarkerLayerId, sourceId: earthquakeSourceId)
				.opacity(opacity)
		case .heatmap:
			EarthquakeHeatmapLayerContent(layerId: earthquakeHeatmapLayerId, sourceId: earthquakeSourceId)
				.opacity(opacity)
		}
	}
	
	private var opacity: Double = 1.0
	
	private let mapBounds: CoordinateBounds
	
	private let mode: Mode
	
	private let earthquakeSourceId: String
	
	private let earthquakeHeatmapLayerId: String
	
	private let earthquakeMarkerLayerId: String
}
