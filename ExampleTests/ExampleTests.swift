//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by Emre on 13.05.2023.
//

import XCTest
@testable import Example

final class ExampleTests: XCTestCase {

    var viewModel: ExampleViewModel!

    override func setUpWithError() throws {
        super.setUpWithError()
        viewModel = ExampleViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        super.tearDownWithError()
    }

    func testImagesInitialization() throws {
            let images = try XCTUnwrap(viewModel.images.value)
            XCTAssertEqual(images.count, 6, "Expected images count to be 6")
            XCTAssertEqual(images[0].color, UIColor(named: "dark")!, "Expected first image color to be dark")
            XCTAssertEqual(images[0].title, "Lorem ipsum dolor set amet", "Expected first image title to be 'Lorem ipsum dolor set amet'")
            XCTAssertEqual(images[1].color, UIColor(named: "purple")!, "Expected second image color to be purple")
            XCTAssertEqual(images[1].title, "Lorem ipsum dolor set amet", "Expected second image title to be 'Lorem ipsum dolor set amet'")
            XCTAssertEqual(images[2].color, UIColor(named: "yellow")!, "Expected third image color to be yellow")
            XCTAssertEqual(images[2].title, "Lorem ipsum dolor set amet", "Expected third image title to be 'Lorem ipsum dolor set amet'")
            XCTAssertEqual(images[3].color, UIColor(named: "cyan")!, "Expected fourth image color to be cyan")
            XCTAssertEqual(images[3].title, "Lorem ipsum dolor set amet", "Expected fourth image title to be 'Lorem ipsum dolor set amet'")
            XCTAssertEqual(images[4].color, UIColor(named: "red")!, "Expected fifth image color to be red")
            XCTAssertEqual(images[4].title, "Lorem ipsum dolor set amet", "Expected fifth image title to be 'Lorem ipsum dolor set amet'")
            XCTAssertEqual(images[5].color, UIColor(named: "green")!, "Expected sixth image color to be green")
            XCTAssertEqual(images[5].title, "Lorem ipsum dolor set amet", "Expected sixth image title to be 'Lorem ipsum dolor set amet'")
        }
}
