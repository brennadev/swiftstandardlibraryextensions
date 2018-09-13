//
//  ArrayExtension.swift
//  SwiftStandardLibraryExtensions
//
/*
 MIT License
 
 Copyright (c) 2016-2018 Brenna Olson
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

// For improved filtering with arrays
extension Array {
    /**
     Remove all elements that match a predicate
     - complexity: Typically O(n)
     - parameter isIncluded: Predicate to filter by
     - returns: `Array` containiing all values removed */
    mutating func filterAndRemove(_ isIncluded: (Element) -> Bool) -> Array<Element> {
        var removedValues = [Element]()
        /// array is set to this
        var savedValues = [Element]()
        
        for value in self {
            if isIncluded(value) {
                removedValues.append(value)
            } else {
                savedValues.append(value)
            }
        }
        self = savedValues
        return removedValues
    }
    
    
    /// Remove up to a specific number of elements that match a predicate
    /// - parameter count: Maximum number of items to remove from array
    /// - parameter isIncluded: Predicate to filter by
    /// - returns: `Array` containiing all values removed
    mutating func filterAndRemove(count: Int, _ isIncluded: (Element) -> Bool) -> Array<Element> {
        var removedValues = [Element]()
        /// array is set to this
        var savedValues = [Element]()
        
        for value in self {
            if isIncluded(value) && removedValues.count < count {
                removedValues.append(value)
            } else {
                savedValues.append(value)
            }
        }
        self = savedValues
        return removedValues
    }
}
