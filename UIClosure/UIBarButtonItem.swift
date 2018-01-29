
import UIKit

/// :nodoc:
private let jzyBug = 0 // Prevent the license header from showing up in Jazzy Docs for UICollectionView

public extension UIBarButtonItem {
    /**
     A convenience initializer for a UIBarButtonItem so that the tap event can
     be handled with a closure. This is equivalent of using the init(image:style:target:action:)
     initializer.
     
     * parameter image: The image to use for the button
     * parameter style: The `UIBarButtonItemStyle` of the button
     * parameter handler: The closure that is called when the button is tapped
     */
    public convenience init(image: UIImage?, style: UIBarButtonItemStyle, handler: @escaping () -> Void) {
        self.init(image: image, style: style, target: nil, action: nil)
        onTap(handler: handler)
    }
    
    /**
     A convenience initializer for a UIBarButtonItem so that the tap event can
     be handled with a closure. This is equivalent of using the init(image:landscapeImagePhone:style:target:action:)
     initializer.
     
     * parameter image: The image to use for the button
     * parameter landscapeImagePhone: The image to use for the compressed landscape bar item
     * parameter style: The `UIBarButtonItemStyle` of the button
     * parameter handler: The closure that is called when the button is tapped
     */
    @available(iOS 5.0, *)
    public convenience init(image: UIImage?, landscapeImagePhone: UIImage?, style: UIBarButtonItemStyle, handler: @escaping () -> Void) {
        self.init(image: image, landscapeImagePhone: landscapeImagePhone, style: style, target: nil, action: nil)
        onTap(handler: handler)
    }
    
    /**
     A convenience initializer for a UIBarButtonItem so that the tap event can
     be handled with a closure. This is equivalent of using the init(title:style:target:action:)
     initializer.
     
     * parameter title: The text to use for the button
     * parameter style: The `UIBarButtonItemStyle` of the button
     * parameter handler: The closure that is called when the button is tapped
     */
    public convenience init(title: String?, style: UIBarButtonItemStyle, handler: @escaping () -> Void) {
        self.init(title: title, style: style, target: nil, action: nil)
        onTap(handler: handler)
    }
    
    /**
     A convenience initializer for a UIBarButtonItem so that the tap event can
     be handled with a closure. This is equivalent of using the init(barButtonSystemItem:target:action:)
     initializer.
     
     * parameter barButtonSystemItem: The `UIBarButtonSystemItem` to be used for the button
     * parameter handler: The closure that is called when the button is tapped
     */
    public convenience init(barButtonSystemItem systemItem: UIBarButtonSystemItem, handler: @escaping () -> Void) {
        self.init(barButtonSystemItem: systemItem, target: nil, action: nil)
        onTap(handler: handler)
    }
    
    /**
     This method is a convenience method to add a closure handler to a `UIBarButtonItem`.
     Use this method if you are creating a `UIBarButtonItem` using an initializer
     other than the convience ones provide, or if the item was created by a
     Storyboard or xib.
     
     * * * *
     #### An example that adds a closure handler to an existing `UIBarButtonItem`:
     
     ```swift
     myBarButtonItem.onTap {
         // bar button tapped code
     }
     ```
     
     * parameter handler: The closure that will be called when the tap is recognized.
     */
    public func onTap(handler: @escaping () -> Void) {
        target = self
        action = #selector(UIBarButtonItem.buttonTapped)
        NotificationCenter.selfObserve(name: .barButtonItemTapped, target: self) { button, userInfo in
            handler()
        }
    }
}

fileprivate extension UIBarButtonItem {
    @objc func buttonTapped() {
        NotificationCenter.closures.post(name: .barButtonItemTapped, object: self)
    }
}

fileprivate extension Notification.Name {
    static let barButtonItemTapped = Notification.Name("UIBarButtonItem.tapped")
}
