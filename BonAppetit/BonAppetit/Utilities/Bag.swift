//
//  Bag.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 24.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import Foundation

struct Bag<Element: Hashable> {
    var contents: [Element: Int] = [:]

    var uniqueCount: Int {
        return contents.count
    }

    var totalCount: Int {
        return contents.values.reduce(0) { $0 + $1 }
    }

    init() { }

    init<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        for element in sequence {
            add(element)
        }
    }

    init<S: Sequence>(_ sequence: S) where S.Iterator.Element == (key: Element, value: Int) {
        for (element, count) in sequence {
            add(element, occurrences: count)
        }
    }

    mutating func add(_ member: Element, occurrences: Int = 1) {
        precondition(occurrences > 0, "Can only add a positive number of occurrences")
        if let currentCount = contents[member] {
            contents[member] = currentCount + occurrences
        } else {
            contents[member] = occurrences
        }
    }

    mutating func remove(_ member: Element, occurrences: Int = 1) {
        guard let currentCount = contents[member], currentCount >= occurrences else {
            preconditionFailure("Removed non-existent elements")
        }
        precondition(occurrences > 0, "Can only remove a positive number of occurrences")
        if currentCount > occurrences {
            contents[member] = currentCount - occurrences
        } else {
            contents.removeValue(forKey: member)
        }
    }
}

extension Bag: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
}

extension Bag: ExpressibleByDictionaryLiteral {
    init(dictionaryLiteral elements: (Element, Int)...) {
        // The map converts elements to the "named" tuple the initializer expects.
        self.init(elements.map { (key: $0.0, value: $0.1) })
    }
}

extension Bag: Sequence {
    typealias Iterator = AnyIterator<(element: Element, count: Int)>

    func makeIterator() -> Iterator {
        var iterator = contents.makeIterator()
        return AnyIterator {
            return iterator.next()
        }
    }
}

struct BagIndex<Element: Hashable> {
    fileprivate let index: DictionaryIndex<Element, Int>

    fileprivate init(_ dictionaryIndex: DictionaryIndex<Element, Int>) {
        self.index = dictionaryIndex
    }
}

extension BagIndex: Comparable {
    static func == (lhs: BagIndex, rhs: BagIndex) -> Bool {
        return lhs.index == rhs.index
    }

    static func < (lhs: BagIndex, rhs: BagIndex) -> Bool {
        return lhs.index < rhs.index
    }
}

extension Bag: Collection {
    typealias Index = BagIndex<Element>

    var startIndex: Index {
        return BagIndex(contents.startIndex)
    }

    var endIndex: Index {
        return BagIndex(contents.endIndex)
    }

    subscript (position: Index) -> Iterator.Element {
        precondition((startIndex ..< endIndex).contains(position), "out of bounds")
        let dictionaryElement = contents[position.index]
        return (element: dictionaryElement.key, count: dictionaryElement.value)
    }

    func index(after i: Index) -> Index {
        return Index(contents.index(after: i.index))
    }
}
