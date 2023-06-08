

import UIKit

final class FixedRefreshControl: UIRefreshControl {
    
    override var frame: CGRect {
        get { return super.frame }
        set {
            var newFrame = newValue
            if let superScrollView = superview as? UIScrollView {
                newFrame.origin.x = superScrollView.frame.minX - superScrollView.contentInset.left
            }
            super.frame = newFrame
        }
    }
    
}
