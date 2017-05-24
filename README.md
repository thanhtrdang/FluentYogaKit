# FluentYogaKit

E.g.

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView()
        redView.backgroundColor = .red
        
        view.addSubview(redView)
        
        view.yoga
            .isEnabled(true)
            .justifyContent(.center)
            .alignItems(.center)
        
        redView.yoga
            .isEnabled(true)
            .size(width: 56, height: 56)
        
        view.yoga.applyLayout(preservingOrigin: true)
    }

}
