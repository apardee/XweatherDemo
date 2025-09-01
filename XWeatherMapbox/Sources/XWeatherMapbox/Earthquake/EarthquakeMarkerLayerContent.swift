//
//  EarthquakeMarkerLayerContent.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps

/// A map content component that displays earthquake data as individual circular markers.
///
/// `EarthquakeMarkerLayerContent` visualizes earthquakes as colored circles on the map,
/// with colors indicating magnitude levels: green (low), yellow (moderate), orange (high),
/// and red (severe). Each marker has a white stroke for better visibility.
///
/// This component is typically used by `EarthquakeMapContent` when configured with `.marker` mode,
/// but can be used independently for custom earthquake visualizations.
public struct EarthquakeMarkerLayerContent: MapContent {
	
	/// Creates a new earthquake marker layer content component.
	///
	/// - Parameters:
	///   - layerId: The identifier for the marker layer. Uses the default if not specified.
	///   - sourceId: The identifier for the earthquake data source. Uses the default if not specified.
	///   - opacity: The opacity level for the markers (0.0 to 1.0). Defaults to `1.0`.
	public init(layerId: String = Constants.defaultEarthquakeMarkerLayerId,
				sourceId: String = Constants.defaultEarthquakeSourceId,
				opacity: Double = 1.0) {
		self.layerId = layerId
		self.sourceId = sourceId
		self.opacity = opacity
	}
	
	/// The map content body that creates the circle layer with magnitude-based styling.
	public var body: some MapContent {
		CircleLayer(id: layerId, source: sourceId)
			.circleRadius(8.0)
			.circleStrokeColor("white")
			.circleStrokeWidth(2.0)
			.circleColor(colorExp)
			.circleOpacity(opacity)
	}
	
	/// Sets the opacity level for the marker layer.
	///
	/// - Parameter opacity: The opacity value from 0.0 (fully transparent) to 1.0 (fully opaque).
	/// - Returns: A new instance of `EarthquakeMarkerLayerContent` with the updated opacity setting.
	public func opacity(_ opacity: Double) -> Self {
		var result = self
		result.opacity = opacity
		return result
	}
	
	private var colorExp: Exp {
		Exp(.step) {
			Exp(.get) {
				"mag"
				Exp(.get) {
					"report"
				}
			}
			"rgba(0.0, 153.0, 0.0, 255.0)"
			3
			"rgba(255.0, 204.0, 0.0, 255.0)"
			5
			"rgba(255.0, 103.0, 0.0, 5.0)"
			7
			"rgba(255.0, 0.0, 0.0, 255.0)"
		}
	}
	
	private var opacity: Double = 1.0
	
	private let layerId: String
	
	private let sourceId: String
}
