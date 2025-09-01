//
//  RasterTileMapContent.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

struct RasterTilePathFormat {
	
	var type: String
	
	var format: String = Constants.defaultRasterFormat
	
	var credentials: Credentials
	
	var tilePath: String {
		"\(Constants.mapsApiBase)/\(credentials.clientId)_\(credentials.secret)/\(type)/{z}/{x}/{y}/\(format)"
	}
}
