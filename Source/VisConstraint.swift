//
//  VisConstraint.swift
//  Viscosity
//
//  Created by WzxJiang on 16/7/21.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//
//  https://github.com/Wzxhaha/Viscosity
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import UIKit

public class VisConstraint: NSObject {
    
    internal var toItem:      AnyObject?
    internal var constant:    CGFloat = 0
    internal var multiplier:  CGFloat = 1
    internal var isActive:    Bool    = true
    internal var priority:    UILayoutPriority  = UILayoutPriorityRequired
    internal var relation:    NSLayoutRelation  = .equal
    internal var attribute:   NSLayoutAttribute = .notAnAttribute
    internal var toAttribute: NSLayoutAttribute = .notAnAttribute
    
    init(attribute: NSLayoutAttribute) {
        self.attribute = attribute
    }
    
    // MARK: - equal
    @nonobjc
    @discardableResult
    public func equalTo(_ item: UIView) -> VisConstraint {
        set(view: item, relation: .equal)
        return self
    }
    
    @nonobjc
    @discardableResult
    public func equalTo(_ item: CGFloat) -> VisConstraint {
        set(number: item, relation: .equal)
        return self
    }
    
    @nonobjc
    @discardableResult
    public func equalTo(_ item: VisConstraint) -> VisConstraint {
        set(constraint: item, relation: .equal)
        return self
    }
    
    // MARK: - greater than or equal
    @nonobjc
    @discardableResult
    public func greaterThanOrEqualTo(_ item: UIView) -> VisConstraint {
        set(view: item, relation: .greaterThanOrEqual)
        return self
    }
    
    @nonobjc
    @discardableResult
    public func greaterThanOrEqualTo(_ item: CGFloat) -> VisConstraint {
        set(number: item, relation: .greaterThanOrEqual)
        return self
    }
    
    @nonobjc
    @discardableResult
    public func greaterThanOrEqualTo(_ item: VisConstraint) -> VisConstraint {
        set(constraint: item, relation: .greaterThanOrEqual)
        return self
    }
    
    // MARK: - less than or equal
    @nonobjc
    @discardableResult
    public func lessThanOrEqualTo(_ item: UIView) -> VisConstraint {
        set(view: item, relation: .lessThanOrEqual)
        return self
    }
    
    @nonobjc
    @discardableResult
    public func lessThanOrEqualTo(_ item: CGFloat) -> VisConstraint {
        set(number: item, relation: .lessThanOrEqual)
        return self
    }
    
    @nonobjc
    @discardableResult
    public func lessThanOrEqualTo(_ item: VisConstraint) -> VisConstraint {
        set(constraint: item, relation: .lessThanOrEqual)
        return self
    }

    // MARK: - other
    @discardableResult
    public func offset(_ offset: CGFloat) -> VisConstraint {
        constant = offset
        return self
    }
    
    @discardableResult
    public func multiplier(_ multiplier: CGFloat) -> VisConstraint {
        self.multiplier = multiplier
        return self
    }
    
    @discardableResult
    public func priority(_ priority: UILayoutPriority) -> VisConstraint {
        self.priority = priority
        return self
    }
    
    @discardableResult
    public func isActive(_ isActive: Bool) -> VisConstraint {
        self.isActive = isActive
        return self
    }
    
    private func set(view: UIView, relation: NSLayoutRelation) -> Void {
        toItem        = view
        toAttribute   = attribute
        self.relation = relation
    }
    
    private func set(number: CGFloat, relation: NSLayoutRelation) -> Void {
        toItem        = nil
        constant      = number
        self.relation = relation
    }
    
    private func set(constraint: VisConstraint, relation: NSLayoutRelation) -> Void {
        toItem        = constraint.toItem
        toAttribute   = constraint.attribute
        self.relation = relation
    }

}
