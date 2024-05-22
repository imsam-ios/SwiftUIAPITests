//
//  ListViewModelTests.swift
//  PokemonDemoTests
//
//  Created by Sagar Moradia on 22/05/24.
//

import XCTest
@testable import PokemonDemo


class ListViewModelTests: XCTestCase {
    
    func test_API_Failure() {
        var mockService = MockListViewService()
        mockService.result = .failure(.invalidData)
        var sut = PokemonListViewModel(listService: mockService)
        sut.fetchListData()
        XCTAssertEqual(sut.data?.count ?? 0, 0)
    }
    
    func test_API_Success() {
        var mockService = MockListViewService()
        guard let list = mockService.getList() else { return }
        mockService.result = .success(list)
        var sut = PokemonListViewModel(listService: mockService)
        sut.fetchListData()
        XCTAssertNotEqual(sut.data?.count ?? 0, 0)
    }
}
