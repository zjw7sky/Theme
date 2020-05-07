//
//  Theme.swift
//  TestThemeDemo
//
//  Created by yzj on 2020/4/26.
//  Copyright © 2020 yzj. All rights reserved.
//

import UIKit

@objc public enum ThemeType: Int {
    case `default`
    case black
}

enum ContenType: String {
    case color = "color"
    case image = "image"
}

public typealias ThemeBlock = (()->(Bool))

public class Theme: NSObject {
    
    private var themeBlocks: [ThemeBlock] = []
    private var contents: NSDictionary = [:]
    
    @objc
    public static private(set) var shared: Theme = Theme()
    
    @objc
    var type: ThemeType = .default {
        didSet {
            fileDatas()
            themeBlocks = themeBlocks.compactMap { (block) -> ThemeBlock? in
                if block() {
                    return block
                }
                return nil
            }
        }
    }
    
    private override init() {
        super.init()
        fileDatas()
    }
    
    @objc
    func cook(_ block: @escaping ThemeBlock) {
        if block() {
            themeBlocks.append(block)
        }
    }
    
    @objc
    func image(for path: String) -> UIImage? {
        guard let str = content(for: path, type: .image), str.count > 0 else {
            return nil
        }
        return UIImage.init(named: str)
    }
    
    @objc
    func color(for path: String) -> UIColor? {
        guard let str = content(for: path, type: .color), str.count > 0 else {
            return nil
        }
        return UIColor.init(hex: str)
    }
    
}

private extension Theme {
    
    func fileDatas() {
        let fileAppend: String
        switch type {
        case .default:
            fileAppend = ""
        case .black:
            fileAppend = "_black"
        }
        guard let file:String = Bundle.main.path(forResource: "Theme\(fileAppend)", ofType:"plist") else {
            return
        }
        guard let datas = NSDictionary.init(contentsOfFile: file) else { return  }
        contents = datas
    }
    
    func content(for path: String, type: ContenType) -> String? {
        let keyPath: String
        if path.contains(".") {
            keyPath = path
        }
        else {
            keyPath = "\(type.rawValue).\(path)"
            
        }
        return contents.value(forKeyPath: keyPath) as? String
    }
}

extension UIColor {

    public convenience init?(hex: String) {
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count >= 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                 
                let r, g, b, a: CGFloat
                if scanner.scanHexInt64(&hexNumber) {
                    if hexColor.count == 6 {
                        r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                        g = CGFloat((hexNumber & 0xff00) >> 8) / 255
                        b = CGFloat(hexNumber & 0xff) / 255
                        a = 1
                    }
                    else  {
                        r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                        g = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                        b = CGFloat((hexNumber & 0xff00) >> 8) / 255
                        a = CGFloat(hexNumber & 0xff) / 255
                    }
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
             }
         }

        return nil
    }
    
    public convenience init?(hexNumber: Int) {
        let r, g, b, a: CGFloat
        r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
        g = CGFloat((hexNumber & 0xff0000) >> 16) / 255
        b = CGFloat((hexNumber & 0xff00) >> 8) / 255
        a = CGFloat(hexNumber & 0xff) / 255
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}


private var themePickersKey = ""
extension NSObject {

    typealias ThemePickers = [String: ThemeBlock]

    var themePickers: ThemePickers {
        get {
            if let themePickers = objc_getAssociatedObject(self, &themePickersKey) as? ThemePickers {
                return themePickers
            }
            let initValue = ThemePickers()
            objc_setAssociatedObject(self, &themePickersKey, initValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return initValue
        }
        set {
            objc_setAssociatedObject(self, &themePickersKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
