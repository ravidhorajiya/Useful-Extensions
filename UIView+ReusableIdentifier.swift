//
//  UIView+ReusableIdentifier.swift
//
//  Created by Ravi on 30/11/18.
//

import Foundation

protocol Dequeueable: AnyObject {
  static var reuseIdentifier: String { get }
}

extension UICollectionViewCell: Dequeueable {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

extension UITableViewCell: Dequeueable {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

extension UITableViewHeaderFooterView: Dequeueable {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}
