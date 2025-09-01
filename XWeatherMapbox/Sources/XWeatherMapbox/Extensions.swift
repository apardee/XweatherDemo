//
//  Extensions.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps

extension GeoJSONSource {
	
	func generateId(_ newValue: Bool) -> Self {
		var source = self
		source.generateId = newValue
		return source
	}
}
