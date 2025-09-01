//
//  RasterMapContent.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import Foundation
import MapboxMaps

/// A map content component that displays Xweather sourced raster tiles on a Mapbox map.
///
/// `RasterMapContent` provides weather visualization through raster tile layers, including radar imagery
/// and weather alerts. This component handles the configuration of both the data source and display layer.
///
/// ## Usage
///
/// ```swift
/// // Display radar data with default settings
/// RasterMapContent(type: .radar)
///
/// // Display weather alerts with custom opacity
/// RasterMapContent(type: .alerts)
///     .rasterOpacity(0.7)
///
/// // Use custom layer and source identifiers
/// RasterMapContent(type: .radar, layerId: "my-radar-layer", sourceId: "my-radar-source")
/// ```
public struct RasterMapContent: MapContent {
	
	/// The type of raster weather data to display.
	public enum `Type`: String {
		/// Weather radar imagery showing precipitation and storm activity.
		case radar = "radar"
		/// Weather alerts showing warning areas and severity levels.
		case alerts = "alerts"
		
		var defaultLayerId: String {
			switch self {
			case .radar:
				return Constants.defaultRadarLayerId
			case .alerts:
				return Constants.defaultAlertsLayerId
			}
		}
		
		var defaultSourceId: String {
			switch self {
			case .radar:
				return Constants.defaultRadarSourceId
			case .alerts:
				return Constants.defaultAlertsSourceId
			}
		}
	}
	
	/// Creates a new raster map content component with a predefined type.
	///
	/// - Parameters:
	///   - type: The type of raster data to display (radar or alerts).
	///   - layerId: Custom identifier for the raster layer. Uses the type's default if not specified.
	///   - sourceId: Custom identifier for the raster source. Uses the type's default if not specified.
	public init(type: `Type`,
				layerId: String? = nil,
				sourceId: String? = nil) {
		self.rasterOpacity = 1.0
		self.type = type.rawValue
		self.layerId = layerId ?? type.defaultLayerId
		self.sourceId = sourceId ?? type.defaultSourceId
	}
	
	/// Creates a new raster map content component with a custom type name.
	///
	/// Use this initializer when you need to display raster data that doesn't match
	/// the predefined types (radar or alerts).
	///
	/// - Parameters:
	///   - typeName: The name of the custom raster data type.
	///   - layerId: The identifier for the raster layer.
	///   - sourceId: The identifier for the raster source.
	public init(typeName: String,
				layerId: String,
				sourceId: String) {
		self.rasterOpacity = 1.0
		self.type = typeName
		self.layerId = layerId
		self.sourceId = sourceId
	}
	
	/// The map content body that configures the raster data source and display layer.
	///
	/// This computed property creates the raster source with appropriate tile URLs
	/// and configures the display layer with the specified opacity settings.
	public var body: some MapContent {
		RasterSource(id: sourceId)
			.tiles([
				RasterTilePathFormat(type: type,
									 credentials: Credentials.current).tilePath
			])
		
		RasterLayer(id: layerId, source: sourceId)
			.rasterOpacity(rasterOpacity)
	}
	
	/// Sets the opacity level for the raster layer.
	///
	/// - Parameter opacity: The opacity value from 0.0 (fully transparent) to 1.0 (fully opaque).
	/// - Returns: A new instance of `RasterMapContent` with the updated opacity setting.
	public func rasterOpacity(_ opacity: Double) -> Self {
		var result = self
		result.rasterOpacity = opacity
		return result
	}
	
	private let type: String
	
	private let layerId: String
	
	private let sourceId: String
	
	private var rasterOpacity: Double = 1.0
}
