//
//  UIKit+Th.swift
//  TestThemeDemo
//
//  Created by yzj on 2020/4/26.
//  Copyright © 2020 yzj. All rights reserved.
//

import UIKit

public extension UIView{
    
    @objc
    func th_backgroundColor(_ key: String) {
        Theme.shared.cook {[weak self] in
            self?.backgroundColor = Theme.shared.color(for: key)
            return (self != nil)
        }
    }
    
    @objc
    func th_tintColor(_ key: String) {
        Theme.shared.cook {[weak self] in
            self?.tintColor = Theme.shared.color(for: key)
            return (self != nil)
        }
    }
}

public extension UILabel {
    
    @objc
    func th_textColor(_ key: String) {
        Theme.shared.cook {[weak self]  in
            self?.textColor = Theme.shared.color(for: key)
            return (self != nil)
        }
    }
    
    @objc
    func th_highlightedTextColor(_ key: String) {
        Theme.shared.cook {[weak self]  in
            self?.highlightedTextColor = Theme.shared.color(for: key)
            return (self != nil)
        }
    }
    
    @objc
    func th_shadowColor(_ key: String) {
        Theme.shared.cook {[weak self]  in
            self?.shadowColor = Theme.shared.color(for: key)
            return (self != nil)
        }
    }
}

public extension UITextField {
    
    @objc
    func th_textColor(_ key: String) {
        Theme.shared.cook {[weak self]  in
            self?.textColor = Theme.shared.color(for: key)
            return (self != nil)
        }
    }
}

public extension UITextView {
    
    @objc
    func th_textColor(_ key: String) {
        Theme.shared.cook {[weak self]  in
            self?.textColor = Theme.shared.color(for: key)
            return (self != nil)
        }
    }
}

public extension UIButton {
    
    @objc
    func th_setTitleColor(_ key: String, for state: UIControl.State) {
        Theme.shared.cook {[weak self] in
            self?.setTitleColor(Theme.shared.color(for: key), for: state)
            return (self != nil)
        }
    }
    
    @objc
    func th_setImage(_ key: String, for state: UIControl.State) {
        Theme.shared.cook {[weak self] in
            self?.setImage(Theme.shared.image(for: key), for: state)
            return (self != nil)
        }
    }
    
    @objc
    func th_setBackgroundImage(_ key: String, for state: UIControl.State) {
        Theme.shared.cook {[weak self] in
            self?.setBackgroundImage(Theme.shared.image(for: key), for: state)
            return (self != nil)
        }
    }
}
 
public extension UIImageView {
    
    @objc
    func th_image(_ key: String) {
        Theme.shared.cook {[weak self] in
            self?.image = Theme.shared.image(for: key)
            return (self != nil)
        }
    }
}

public extension UIBarItem {
    
    @objc
    func th_image(_ key: String) {
        Theme.shared.cook {[weak self] in
            self?.image = Theme.shared.image(for: key)
            return (self != nil)
        }
    }
}
