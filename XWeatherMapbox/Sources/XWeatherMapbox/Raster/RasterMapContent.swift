//
//  RasterMapContent.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import Foundation
import MapboxMaps

public struct RasterMapContent: MapContent {
	
	public enum `Type`: String {
		case radar = "radar"
		case alerts = "alerts"
		
		var defaultLayerId: String {
			switch self {
			case .radar:
				return "radar-layer"
			case .alerts:
				return "alert-layer"
			}
		}
		
		var defaultSourceId: String {
			switch self {
			case .radar:
				return "radar-source"
			case .alerts:
				return "alert-source"
			}
		}
	}
	
	public init(type: `Type`,
				layerId: String? = nil,
				sourceId: String? = nil) {
		self.rasterOpacity = 1.0
		self.type = type.rawValue
		self.layerId = layerId ?? type.defaultLayerId
		self.sourceId = sourceId ?? type.defaultSourceId
	}
	
	public init(typeName: String,
				layerId: String,
				sourceId: String) {
		self.rasterOpacity = 1.0
		self.type = typeName
		self.layerId = layerId
		self.sourceId = sourceId
	}
	
	public var body: some MapContent {
		RasterSource(id: sourceId)
			.tiles([
				RasterTilePathFormat(type: type,
									 credentials: Credentials.current).tilePath
			])
		
		RasterLayer(id: layerId, source: sourceId)
			.rasterOpacity(rasterOpacity)
	}
	
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
