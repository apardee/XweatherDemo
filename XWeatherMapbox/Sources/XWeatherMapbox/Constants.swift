//
//  Constants.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

/// A collection of default identifiers and configuration values used throughout the XWeatherMapbox framework.
///
/// This struct provides centralized constants for map layer and source identifiers, making it easy to maintain
/// consistency across your weather map implementations.
public struct Constants {
	
	/// The default identifier for earthquake data sources.
	///
	/// Use this identifier when adding earthquake data to your map if you don't need a custom source ID.
	public static let defaultEarthquakeSourceId = "earthquake-source"
	
	/// The default identifier for earthquake marker layers.
	///
	/// This layer displays earthquakes as individual point markers on the map.
	public static let defaultEarthquakeMarkerLayerId = "earthquake-marker-layer"
	
	/// The default identifier for earthquake heatmap layers.
	///
	/// This layer displays earthquakes as a density heatmap, useful for visualizing earthquake concentration areas.
	public static let defaultEarthquakeHeatmapLayerId = "earthquake-heatmap-layer"
	
	/// The default identifier for radar data sources.
	///
	/// Use this identifier when adding radar weather data to your map.
	public static let defaultRadarSourceId = "radar-source"
	
	/// The default identifier for radar layers.
	///
	/// This layer displays weather radar imagery as raster tiles.
	public static let defaultRadarLayerId = "radar-layer"
	
	/// The default identifier for weather alerts data sources.
	///
	/// Use this identifier when adding weather alert data to your map.
	public static let defaultAlertsSourceId = "alerts-source"
	
	/// The default identifier for weather alerts layers.
	///
	/// This layer displays weather alerts as raster tiles showing alert boundaries and severity.
	public static let defaultAlertsLayerId = "alerts-layer"
	
	static let mapsApiBase = "https://maps.api.xweather.com"
	
	static let dataApiBase = "https://data.api.xweather.com"
	
	static let apiClientIdConfigKey = "XWeatherClientID"
	
	static let apiSecretConfigKey = "XWeatherSecret"
	
	static let defaultRasterFormat = "current@2x.png"
}
