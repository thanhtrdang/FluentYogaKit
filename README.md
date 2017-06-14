# FluentYogaKit

E.g.

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView()
        redView.backgroundColor = .red
        
        view.subview(redView)
        
        view.yoga
            .center(redView.yoga.size(width: 56, height: 56))
            .apply()
    }

}
