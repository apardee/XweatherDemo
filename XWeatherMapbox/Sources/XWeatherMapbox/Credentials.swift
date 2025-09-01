//
//  Credentials.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import Foundation

struct Credentials: Sendable {
	
	static let current: Credentials = fromBundle()
	
	init(clientId: String, secret: String) {
		self.clientId = clientId
		self.secret = secret
	}
	
	private static func fromBundle() -> Credentials {
		guard let infoDictionary = Bundle.main.infoDictionary else {
			return .init(clientId: "", secret: "")
		}
		
		let clientId = infoDictionary[Constants.apiClientIdConfigKey] as? String ?? ""
		let secret = infoDictionary[Constants.apiSecretConfigKey] as? String ?? ""
		
		return .init(clientId: clientId, secret: secret)
		
	}
	
	let clientId: String
	let secret: String
}
