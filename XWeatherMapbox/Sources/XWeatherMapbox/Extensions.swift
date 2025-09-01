//
//  Extensions.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps

extension GeoJSONSource {
	
	/// Configures whether the GeoJSON source should generate feature IDs automatically.
	///
	/// When enabled, Mapbox will automatically generate unique identifiers for features
	/// that don't already have an `id` property. This is useful for feature state management
	/// and interactive map features.
	///
	/// - Parameter newValue: `true` to enable automatic ID generation, `false` to disable.
	/// - Returns: A new `GeoJSONSource` instance with the updated ID generation setting.
	func generateId(_ newValue: Bool) -> Self {
		var source = self
		source.generateId = newValue
		return source
	}
}
