import XCTest
@testable import task2_1

class MuseumDataLoaderTests: XCTestCase {
    func testLoadItems() {
        let items = MuseumDataLoader.loadItems()
        XCTAssertFalse(items.isEmpty, "Данные из plist не загружены")
    }

    func testItemProperties() {
        let items = MuseumDataLoader.loadItems()
        let firstItem = items.first!
        XCTAssertFalse(firstItem.name.isEmpty, "Название музея не должно быть пустым")
        XCTAssertFalse(firstItem.description.isEmpty, "Описание музея не должно быть пустым")
        XCTAssertFalse(firstItem.history.isEmpty, "История музея не должна быть пустой")
        XCTAssertNotNil(firstItem.image, "Изображение музея не должно быть nil")
    }
}