//
//  UIView+Nib.swift
//
//  Created by Ravi on 30/11/18.
//

import Foundation

extension UIView {
  static func loadFromNib() -> Self {
    func instantiateFromNib<T: UIView>(_ viewType: T.Type) -> T {
      let views = Bundle.main.loadNibNamed(String(describing: self), owner: self, options: nil)
      let view = views![0] as! UIView
      return view as! T
    }
    
    return instantiateFromNib(self)
  }
}

extension UIView {
  
  /// Return an UINib object from the nib file with the same name.
  class var nib: UINib? {
    return UINib(nibName: String(describing: self), bundle: nil)
  }
  
  class var viewFromNib: UIView? {
    let views = Bundle.main.loadNibNamed(String(describing: self), owner: self, options: nil)
    let view = views![0] as! UIView
    return view
  }
}
