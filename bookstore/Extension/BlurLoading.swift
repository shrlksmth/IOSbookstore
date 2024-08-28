import UIKit
import JGProgressHUD

class BlurLoadingView {
    
    private var blurEffectView: UIVisualEffectView?
    private var activityIndicator: UIActivityIndicatorView?
    private weak var viewController: UIViewController?
    private var view: UIView?
    let hud = JGProgressHUD()
    
    init(view: UIView, viewController : UIViewController) {
        self.view = view
        self.viewController = viewController
    }
    
    func show(){
        viewController?.navigationController?.navigationBar.isUserInteractionEnabled = false
        hud.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        hud.show(in: view!)
    }
    
    func hide(){
        viewController?.navigationController?.navigationBar.isUserInteractionEnabled = true
        hud.dismiss()
    }
    
    func successAlert(){
        hud.indicatorView = JGProgressHUDSuccessIndicatorView()
        hud.hudView.backgroundColor = UIColor.systemGreen
        hud.show(in: view!)
        hud.dismiss(afterDelay: 3)
    }
    
}
