import Foundation

#warning("This algorithm is not correct. Example: \"bbbc\".firstIndex(of: \"bbc\") will return `nil`, while the answer is `1`.")

/// Return the first match of the collection (pattern) in the collection, or nil if no matches are found.
/// Time: O(N)
/// Space O(1)
public extension Collection where Element: Equatable {
    func firstIndex(of collection: Self) -> Index? {
        guard !collection.isEmpty && collection.endIndex <= endIndex else { return nil }
        
        var result: Index?
        var pIndex = collection.startIndex

        for i in indices {
            if self[i] == collection[pIndex] {
                result = result ?? i
                pIndex = collection.index(after: pIndex)
                guard pIndex < collection.endIndex else { return result }
            } else if self[i] == collection[collection.startIndex] {
                result = i
                pIndex = collection.index(after: collection.startIndex)
            } else { 
                result = nil
                pIndex = collection.startIndex
            }
        }

        return nil
    }
}

func assertFirstIndex<C: Collection>(of pattern: C, in source: C, is result: Int?) where C.Element: Equatable { 
    let firstIndex = source.firstIndex(of: pattern).map { source.distance(from: source.startIndex, to: $0) }
    // print(firstIndex as Any)
    assert(firstIndex == result)
}