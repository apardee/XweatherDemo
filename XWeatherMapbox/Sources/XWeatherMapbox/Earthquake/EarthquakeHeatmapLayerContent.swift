//
//  EarthquakeHeatmapLayerContent.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps

/// A map content component that displays earthquake data as a heatmap layer.
///
/// `EarthquakeHeatmapLayerContent` visualizes earthquake density using a color-coded heatmap,
/// with colors ranging from blue (low density) to red (high density). The heatmap intensity
/// scales with zoom level for optimal visualization at different map scales.
///
/// This component is typically used by `EarthquakeMapContent` when configured with `.heatmap` mode,
/// but can be used independently for custom earthquake visualizations.
public struct EarthquakeHeatmapLayerContent: MapContent {
	
	/// Creates a new earthquake heatmap layer content component.
	///
	/// - Parameters:
	///   - layerId: The identifier for the heatmap layer. Uses the default if not specified.
	///   - sourceId: The identifier for the earthquake data source. Uses the default if not specified.
	///   - opacity: The opacity level for the heatmap (0.0 to 1.0). Defaults to `1.0`.
	public init(layerId: String = Constants.defaultEarthquakeMarkerLayerId,
				sourceId: String = Constants.defaultEarthquakeSourceId,
				opacity: Double = 1.0) {
		self.layerId = layerId
		self.sourceId = sourceId
		self.opacity = opacity
	}
	
	/// The map content body that creates the heatmap layer with styling.
	public var body: some MapContent {
		HeatmapLayer(id: layerId, source: sourceId)
			.sourceLayer(sourceId)
			.heatmapWeight(1.0)
			.heatmapRadius(20.0)
			.heatmapColor(colorExp)
			.heatmapIntensity(intensityExp)
			.heatmapOpacity(opacity)
	}
	
	/// Sets the opacity level for the heatmap layer.
	///
	/// - Parameter opacity: The opacity value from 0.0 (fully transparent) to 1.0 (fully opaque).
	/// - Returns: A new instance of `EarthquakeHeatmapLayerContent` with the updated opacity setting.
	public func opacity(_ opacity: Double) -> Self {
		var result = self
		result.opacity = opacity
		return result
	}
	
	private var colorExp: Exp {
		Exp(.interpolate) {
			Exp(.linear)
			Exp(.heatmapDensity)
			0
			"rgba(33.0, 102.0, 172.0, 0.0)"
			0.2
			"rgb(102.0, 169.0, 207.0)"
			0.4
			"rgb(209.0, 229.0, 240.0)"
			0.6
			"rgb(253.0, 219.0, 199.0)"
			0.8
			"rgb(239.0, 138.0, 98.0)"
			1
			"rgb(178.0, 24.0, 43.0)"
		}
	}
	
	private var intensityExp: Exp {
		Exp(.interpolate) {
			Exp(.linear)
			Exp(.zoom)
			0
			1
			9
			3
		}
	}
	
	private var opacity: Double = 1.0
	
	private let layerId: String
	
	private let sourceId: String
}
