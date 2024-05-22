//
//  APIManager.swift
//  PokemonDemo
//
//  Created by Sagar Moradia on 22/05/24.
//

import UIKit

enum CustomError: Error {
    case invalidURL
    case invalidData
    case invalidResponse
    case network(Error?)
}

typealias ListResultHandler = (Result<PokemonData, CustomError>) -> Void

final class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    //MARK: - Using Async/Await
    func request<T: Decodable>(url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw CustomError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              200 ... 299 ~= response.statusCode else {
            throw CustomError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    //MARK: - Using Closures
    
    func fetchListData(completion: @escaping ListResultHandler) {
        guard let url = URL(string: Constant.API.pokemonListUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let pokemonData = try JSONDecoder().decode(PokemonData.self, from: data)
                completion(.success(pokemonData))
            } catch {
                completion(.failure(.network(error)))
            }
            
        }.resume()
    }
}
