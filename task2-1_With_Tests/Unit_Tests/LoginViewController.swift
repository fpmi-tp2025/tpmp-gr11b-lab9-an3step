import XCTest
@testable import task2_1

class LoginViewControllerTests: XCTestCase {
    var loginVC: LoginViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        loginVC.loadViewIfNeeded()
    }

    func testLoginButtonTappedWithEmptyFields() {
        loginVC.loginTextField.text = ""
        loginVC.passwordTextField.text = ""
        loginVC.loginButtonTapped(UIButton())
        
        // Проверка, что алерт показывается при пустых полях
        XCTAssertTrue(loginVC.presentedViewController is UIAlertController)
    }

    func testLoginButtonTappedWithValidFields() {
        loginVC.loginTextField.text = "user"
        loginVC.passwordTextField.text = "password"
        loginVC.loginButtonTapped(UIButton())
        
        // Проверка, что данные сохраняются в UserDefaults
        let defaults = UserDefaults.standard
        XCTAssertEqual(defaults.string(forKey: "userLogin"), "user")
        XCTAssertEqual(defaults.string(forKey: "userPassword"), "password")
    }
}