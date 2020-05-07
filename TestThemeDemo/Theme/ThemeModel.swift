//
//  MapAble.swift
//  TestThemeDemo
//
//  Created by yzj on 2020/4/26.
//  Copyright © 2020 yzj. All rights reserved.
//

import Foundation

class ThemeValues {
    
}

private var themesKey = ""
extension NSObject { 
    typealias Themes = [Selector : [Any]]
    
    var themes: Themes {
        get {
            if let themePickers = objc_getAssociatedObject(self, &themesKey) as? Themes {
                return themePickers
            }
            let initValue = Themes()
            objc_setAssociatedObject(self, &themesKey, initValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return initValue
        }
        set {
            objc_setAssociatedObject(self, &themesKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func performTheme(selector: Selector) {
        guard responds(to: selector) else { return }
         
    }
}

 
