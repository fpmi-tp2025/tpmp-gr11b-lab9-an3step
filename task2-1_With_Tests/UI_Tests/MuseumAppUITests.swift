import XCTest

class MuseumAppUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testLoginScreen() {
        let loginTextField = app.textFields["loginTextField"]
        let passwordTextField = app.textFields["passwordTextField"]
        let loginButton = app.buttons["loginButton"]

        // Проверка пустых полей
        loginButton.tap()
        XCTAssertTrue(app.alerts["Ошибка"].exists)

        // Ввод данных и переход
        loginTextField.tap()
        loginTextField.typeText("user")
        passwordTextField.tap()
        passwordTextField.typeText("password")
        loginButton.tap()

        // Проверка перехода на экран музеев
        XCTAssertTrue(app.navigationBars["Музеи"].exists)
    }

    func testMuseumCollectionScreen() {
        // Предварительный вход в приложение
        let loginTextField = app.textFields["loginTextField"]
        let passwordTextField = app.textFields["passwordTextField"]
        let loginButton = app.buttons["loginButton"]

        loginTextField.tap()
        loginTextField.typeText("user")
        passwordTextField.tap()
        passwordTextField.typeText("password")
        loginButton.tap()

        // Проверка отображения коллекции
        let collectionView = app.collectionViews.firstMatch
        XCTAssertTrue(collectionView.exists)
        XCTAssertGreaterThan(collectionView.cells.count, 0)

        // Переход к детальному экрану
        let firstCell = collectionView.cells.element(boundBy: 0)
        firstCell.tap()
        XCTAssertTrue(app.navigationBars["Детали"].exists)
    }
}