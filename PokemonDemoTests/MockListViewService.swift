//
//  MockListViewService.swift
//  PokemonDemoTests
//
//  Created by Sagar Moradia on 22/05/24.
//

import Foundation
@testable import PokemonDemo

class MockListViewService: ListViewServiceDelegate  {
    
    var result: Result<PokemonData, CustomError>!
    
    func getList(completion: @escaping ListResultHandler) {
        completion(result)
    }
    
    func getList() -> PokemonData? {
        do {
            guard let fileUrl = Bundle.main.url(forResource: "listdata", withExtension: "json") else {
                return nil
            }
            let data = try Data(contentsOf: fileUrl)
            return try JSONDecoder().decode(PokemonData.self, from: data)
        } catch {
            return nil
        }
    }
}
